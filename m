Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3C8818B29
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Dec 2023 16:25:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFby0-0004Oh-DU;
	Tue, 19 Dec 2023 15:25:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rFbxy-0004OY-Tk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 15:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EZ7Ur/fNIDULB1KEsmWGPj91K1ylapGRq4Q9lVZXZKo=; b=EwwYLI6petY9gQ5ufpetNc+hMe
 DDuq2W0BFMiAl9UKI3I3L53ltguEUMdKTqkQa7KN2yFzSuxsQkPjNzjkzGFFNZbIi+HZeIiP7g28e
 bwLwzDj7072QTkQruCc+ozYkh0vQwQNpT9YUhnL4ZQ7K9gWjbD5qkXtSqg5yuTvyL1cQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EZ7Ur/fNIDULB1KEsmWGPj91K1ylapGRq4Q9lVZXZKo=; b=bOBZyvu1p3HIloDgxoqSkTWok/
 8CbMGA5z2TYQ42De3kd8BN7lE19Yv/UMRWT5eBiMg+HXE/hWTzvcqk6LnWUbY1zSvG9IBgbum5v9G
 yw19vRt0tf3SjifOqA36B5FPGJTHSLuJ7Q+oMHHBKbHxSrTuB0hReZGFGZh2NaGrafHE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFbxy-0008PF-K7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 15:25:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC6E96134F;
 Tue, 19 Dec 2023 15:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF64BC433C9;
 Tue, 19 Dec 2023 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702999497;
 bh=qK6fcLZbrwOVOezRdvRUvaswX/bcYxsDd54Ws22dFDg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dY5mpPxmRg45jRMaYdDIidCd6Fb7OGS4flgm6YP1PcIMveLiNUy+Z59wp75S2pcV4
 xGN8dNfhQkPoF0feRcftrPkxNKlKedfOa0XEMjgtlzk4El9yZhNETtz0sx94b7LLYf
 pn1ROSw/kdLZb0fmJ9yJh3rzeH94t/6wnefurHmgBT+UtuZ449onyPmeWQz+jOimZt
 CNWrZsjuAhJcjXgGYmafD/pzVGWudme61nfYj8MBxJSej5G5/Cui1nJSu8YHUzp9Rs
 qdLrBK+XTiYIhJF/ntnakiUJjmoITaVSZuZLZksEP22dtfa0dkMlDVswaIptXhbxIu
 ShzlptRjMAGnw==
Message-ID: <cac5bf07-9091-40b7-8fb2-01f7a032d2ef@kernel.org>
Date: Tue, 19 Dec 2023 23:24:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1702952464-22050-1-git-send-email-zhiguo.niu@unisoc.com>
 <6c553a75-4842-4b28-9725-ba5e297ff793@kernel.org>
 <CAHJ8P3LgQB9Q_TQj0nmjKXLsk95uVA2xvPXdvpK8Gjsonz-fHg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3LgQB9Q_TQj0nmjKXLsk95uVA2xvPXdvpK8Gjsonz-fHg@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/12/19 12:09, Zhiguo Niu wrote: > On Tue, Dec 19, 2023
    at 12:00 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2023/12/19 10:21,
    Zhiguo Niu wrote: >>> The current pending_discard attr just only [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFbxy-0008PF-K7
Subject: Re: [f2fs-dev] [PATCH V4] f2fs: show more discard status by sysfs
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy8xMi8xOSAxMjowOSwgWmhpZ3VvIE5pdSB3cm90ZToKPiBPbiBUdWUsIERlYyAxOSwg
MjAyMyBhdCAxMjowMOKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+
IE9uIDIwMjMvMTIvMTkgMTA6MjEsIFpoaWd1byBOaXUgd3JvdGU6Cj4+PiBUaGUgY3VycmVudCBw
ZW5kaW5nX2Rpc2NhcmQgYXR0ciBqdXN0IG9ubHkgc2hvd3MgdGhlIGRpc2NhcmRfY21kX2NudAo+
Pj4gaW5mb3JtYXRpb24uIE1vcmUgZGlzY2FyZCBzdGF0dXMgY2FuIGJlIHNob3duIHNvIHRoYXQg
d2UgY2FuIGNoZWNrCj4+PiB0aGVtIHRocm91Z2ggc3lzZnMgd2hlbiBuZWVkZWQuCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+Pj4gLS0t
Cj4+PiBjaGFuZ2VzIG9mIHYyOiBJbXByb3ZlIHRoZSBwYXRjaCBhY2NvcmRpbmcgdG8gQ2hhbydz
IHN1Z2dlc3Rpb25zLgo+Pj4gY2hhbmdlcyBvZiB2MzogQWRkIGEgYmxhbmsgbGluZSBmb3IgZWFz
eSByZWFkaW5nLgo+Pj4gY2hhbmdlcyBvZiB2NDogU3BsaXQgdG8gdGhyZWUgZW50cmllcwo+Pj4g
LS0tCj4+PiAtLS0KPj4+ICAgIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJm
cyB8IDE1ICsrKysrKysrKysrKysrKwo+Pj4gICAgZnMvZjJmcy9zeXNmcy5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiAg
ICAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzIGIvRG9jdW1lbnRhdGlvbi9B
QkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4+PiBpbmRleCA0ZjFkNGU2Li42MDZhMjk4IDEwMDY0
NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPj4+IEBAIC0xNTks
NiArMTU5LDIxIEBAIERhdGU6ICAgICAgICAgICAgTm92ZW1iZXIgMjAyMQo+Pj4gICAgQ29udGFj
dDogICAgIkphZWdldWsgS2ltIiA8amFlZ2V1a0BrZXJuZWwub3JnPgo+Pj4gICAgRGVzY3JpcHRp
b246ICAgICAgICBTaG93cyB0aGUgbnVtYmVyIG9mIHBlbmRpbmcgZGlzY2FyZCBjb21tYW5kcyBp
biB0aGUgcXVldWUuCj4+Pgo+Pj4gK1doYXQ6ICAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+
L2lzc3VlZF9kaXNjYXJkCj4+Cj4+IEFkZCB0aGVtIHRvIC9zeXMvZnMvZjJmcy88ZGlzaz4vc3Rh
dC8/Cj4gSSBqdXN0IHdhbnQgdG8ga2VlcCB0aGVtIGNvbnNpc3RlbnQgd2l0aCB0aGUgZW50cnkg
InBlbmRpbmdfZGlzY2FyZCIKClRoZXJlIGFyZSB0b28gbWFueSBlbnRyaWVzIGluIHJvb3QgZGly
ZWN0b3J5IG9mIGYyZnMgc3lzZnMgZW50cnksIHNvIEkKY3JlYXRlZCB0aGUgJ3N0YXQnIHN1Yi1k
aXJlY3RvcnkgZm9yIGxhdGVyIGFsbCByZWFkLW9ubHkgc3RhdC1yZWxhdGVkCmVudHJ5LiBJIHRo
aW5rIGl0J3MgZmluZSB0byBjcmVhdGUgbmV3IGRpc2NhcmQgc3RhdCBlbnRyaWVzIHRoZXJlLgoK
VGhhbmtzLAoKPiBpZiB0aGV5IGFyZSBzcGxpdCB0byAzIGVudHJpZXMuCj4gdGhleSBhcmUgYWxs
IGRpc2NhcmQgcmVsYXRlZCBpbmZvcy4KPiBUaGFua3MKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gK0Rh
dGU6ICAgICAgICAgICBEZWNlbWJlciAyMDIzCj4+PiArQ29udGFjdDogICAgICAgICJaaGlndW8g
Tml1IiA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+Pj4gK0Rlc2NyaXB0aW9uOiAgICBTaG93cyB0
aGUgbnVtYmVyIG9mIGlzc3VlZCBkaXNjYXJkLgo+Pj4gKwo+Pj4gK1doYXQ6ICAgICAgICAgICAv
c3lzL2ZzL2YyZnMvPGRpc2s+L3F1ZXVlZF9kaXNjYXJkCj4+PiArRGF0ZTogICAgICAgICAgIERl
Y2VtYmVyIDIwMjMKPj4+ICtDb250YWN0OiAgICAgICAgIlpoaWd1byBOaXUiIDx6aGlndW8ubml1
QHVuaXNvYy5jb20+Cj4+PiArRGVzY3JpcHRpb246ICAgIFNob3dzIHRoZSBudW1iZXIgb2YgcXVl
dWVkIGRpc2NhcmQuCj4+PiArCj4+PiArV2hhdDogICAgICAgICAgIC9zeXMvZnMvZjJmcy88ZGlz
az4vdW5kaXNjYXJkX2Jsa3MKPj4+ICtEYXRlOiAgICAgICAgICAgRGVjZW1iZXIgMjAyMwo+Pj4g
K0NvbnRhY3Q6ICAgICAgICAiWmhpZ3VvIE5pdSIgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPj4+
ICtEZXNjcmlwdGlvbjogICAgU2hvd3MgdGhlIHRvdGFsIG51bWJlciBvZiB1bmRpc2NhcmQgYmxv
Y2tzLgo+Pj4gKwo+Pj4gICAgV2hhdDogICAgICAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+
L21heF92aWN0aW1fc2VhcmNoCj4+PiAgICBEYXRlOiAgICAgICAgICAgICAgIEphbnVhcnkgMjAx
NAo+Pj4gICAgQ29udGFjdDogICAgIkphZWdldWsgS2ltIiA8amFlZ2V1ay5raW1Ac2Ftc3VuZy5j
b20+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4+
PiBpbmRleCA3MDk5ZmZhLi42NjZlZmRkIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9zeXNmcy5j
Cj4+PiArKysgYi9mcy9mMmZzL3N5c2ZzLmMKPj4+IEBAIC0xNDMsNiArMTQzLDMzIEBAIHN0YXRp
YyBzc2l6ZV90IHBlbmRpbmdfZGlzY2FyZF9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJlNNX0koc2JpKS0+ZGNjX2luZm8tPmRpc2Nh
cmRfY21kX2NudCkpOwo+Pj4gICAgfQo+Pj4KPj4+ICtzdGF0aWMgc3NpemVfdCBpc3N1ZWRfZGlz
Y2FyZF9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+PiArICAgICAgICAgICAgIHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgY2hhciAqYnVmKQo+Pj4gK3sKPj4+ICsgICAgIGlmICghU01fSShz
YmkpLT5kY2NfaW5mbykKPj4+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+PiArICAg
ICByZXR1cm4gc3lzZnNfZW1pdChidWYsICIlbGx1XG4iLCAodW5zaWduZWQgbG9uZyBsb25nKWF0
b21pY19yZWFkKAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJlNNX0koc2JpKS0+
ZGNjX2luZm8tPmlzc3VlZF9kaXNjYXJkKSk7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBzc2l6
ZV90IHF1ZXVlZF9kaXNjYXJkX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPj4+ICsgICAgICAg
ICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYpCj4+PiArewo+Pj4gKyAg
ICAgaWYgKCFTTV9JKHNiaSktPmRjY19pbmZvKQo+Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPj4+ICsgICAgIHJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVsbHVcbiIsICh1bnNpZ25l
ZCBsb25nIGxvbmcpYXRvbWljX3JlYWQoCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmU01fSShzYmkpLT5kY2NfaW5mby0+cXVldWVkX2Rpc2NhcmQpKTsKPj4+ICt9Cj4+PiArCj4+
PiArc3RhdGljIHNzaXplX3QgdW5kaXNjYXJkX2Jsa3Nfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICph
LAo+Pj4gKyAgICAgICAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikK
Pj4+ICt7Cj4+PiArICAgICBpZiAoIVNNX0koc2JpKS0+ZGNjX2luZm8pCj4+PiArICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKyAgICAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXVc
biIsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTTV9JKHNiaSktPmRjY19pbmZv
LT51bmRpc2NhcmRfYmxrcyk7Cj4+PiArfQo+Pj4gKwo+Pj4gICAgc3RhdGljIHNzaXplX3QgZ2Nf
bW9kZV9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+PiAgICAgICAgICAgICAgICBzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikKPj4+ICAgIHsKPj4+IEBAIC0xMDI1LDYgKzEw
NTIsOSBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3NiX2ZlYXR1cmVfc2hvdyhzdHJ1Y3QgZjJmc19h
dHRyICphLAo+Pj4gICAgRjJGU19HRU5FUkFMX1JPX0FUVFIobW91bnRlZF90aW1lX3NlYyk7Cj4+
PiAgICBGMkZTX0dFTkVSQUxfUk9fQVRUUihtYWluX2Jsa2FkZHIpOwo+Pj4gICAgRjJGU19HRU5F
UkFMX1JPX0FUVFIocGVuZGluZ19kaXNjYXJkKTsKPj4+ICtGMkZTX0dFTkVSQUxfUk9fQVRUUihp
c3N1ZWRfZGlzY2FyZCk7Cj4+PiArRjJGU19HRU5FUkFMX1JPX0FUVFIocXVldWVkX2Rpc2NhcmQp
Owo+Pj4gK0YyRlNfR0VORVJBTF9ST19BVFRSKHVuZGlzY2FyZF9ibGtzKTsKPj4+ICAgIEYyRlNf
R0VORVJBTF9ST19BVFRSKGdjX21vZGUpOwo+Pj4gICAgI2lmZGVmIENPTkZJR19GMkZTX1NUQVRf
RlMKPj4+ICAgIEYyRlNfR0VORVJBTF9ST19BVFRSKG1vdmVkX2Jsb2Nrc19iYWNrZ3JvdW5kKTsK
Pj4+IEBAIC0xMDg0LDYgKzExMTQsOSBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3NiX2ZlYXR1cmVf
c2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+Pj4gICAgICAgIEFUVFJfTElTVChtYXhfb3JkZXJl
ZF9kaXNjYXJkKSwKPj4+ICAgICAgICBBVFRSX0xJU1QoZGlzY2FyZF9pb19hd2FyZSksCj4+PiAg
ICAgICAgQVRUUl9MSVNUKHBlbmRpbmdfZGlzY2FyZCksCj4+PiArICAgICBBVFRSX0xJU1QoaXNz
dWVkX2Rpc2NhcmQpLAo+Pj4gKyAgICAgQVRUUl9MSVNUKHF1ZXVlZF9kaXNjYXJkKSwKPj4+ICsg
ICAgIEFUVFJfTElTVCh1bmRpc2NhcmRfYmxrcyksCj4+PiAgICAgICAgQVRUUl9MSVNUKGdjX21v
ZGUpLAo+Pj4gICAgICAgIEFUVFJfTElTVChpcHVfcG9saWN5KSwKPj4+ICAgICAgICBBVFRSX0xJ
U1QobWluX2lwdV91dGlsKSwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
