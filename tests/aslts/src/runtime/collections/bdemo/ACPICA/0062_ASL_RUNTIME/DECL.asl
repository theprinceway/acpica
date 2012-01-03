/*
 * Some or all of this work - Copyright (c) 2006 - 2012, Intel Corp.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * Neither the name of Intel Corporation nor the names of its contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 * Bug 62:
 *
 * SUMMARY: Crash of the iASL Compiler when ASL-code contains
 *          a long String declaration
 */


Method(mb62)
{

	Name(s000, // Lines 14 - 91: 78 * 50 + 21 = 3921 bytes
"0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
0123456789012345678901234567890123456789012345678
012345678901234567890"
	)

	Name(s001, "0123456789012345678901234567890123456789012345678
")

	// Prepare a benchmark Buffer (in Local2)

	Store(3921, Local5)
	Store(Buffer(Local5){}, Local2)

	Store(0, Local3)
	Store(Local5, Local1)
	while(Local1) {
		Divide(Local3, 50, Local4)
		Store(Derefof(Index(s001, Local4)), Index(Local2, Local3))
		Increment(Local3)
		Decrement(Local1)
	}

	// Convert the benchmark Buffer into the String
	ToString(Local2, Local5, Local0)

	// Check the original long String Literal
	if (LNotEqual(Local0, s000)) {
		err("", zFFF, 0x000, 0, 0, s000, Local0)
	}
}
