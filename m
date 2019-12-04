Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A04112C48
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2019 14:06:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/733sNQx9E0wXjsaTETaYJVLrG5CD6d+Bno/VR6kZw=; b=jb/OjxEb3IWKAzttNHEZ15Bnc8
	8skhFxNHvh6GNAmJ608BSlavlvhykULscZf2vc99iWNVs20zFdYgPo9nXrI4Jzg0NnmQpMlzaBqVS
	vvy2/OCPh5hVyQM8MdQ8ZnXJAQiu+q24FwM55sHD5Zjdfk2MFzrvHaTkVBo5bsmmMQNQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icUMd-0004bO-G3; Wed, 04 Dec 2019 13:06:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jl.biasini@laposte.net>) id 1icUMc-0004bH-8u
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 13:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QoIoJNvQPoGhf1mEusSBQCFVb/hmuGDTkK983LBNhUA=; b=J3twyohaM2P2i+zE2bSgZwy4pF
 30xQwneTd/HtJ/GSz4T04Z7f3sx+xPTyTf+7Uh5QO0QWL9gRhh98d72Rn8B287ZMJ3bYg4cxn0r46
 CMJIyrojPCjpdcTWAgj7VqzkYYxtTI+5pML3ZpIYSs91dTI3fm+7N6+WvlrpR+73bya0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QoIoJNvQPoGhf1mEusSBQCFVb/hmuGDTkK983LBNhUA=; b=SwLO48aP+zJykiYAPOfINySLTD
 +BKcg0Ku9zkP/G6R0TkRz/q/nhCJuYxPtFFAACcEVZ8DESEF/qcKk1RJ6O1wdXEs9LrnzPKzpnzhF
 F+lCWjZxaKxlBGauUDEhecuLM3X85DHAyQRn4AotgzyND4HK6ZU6+5eqiHoUdydpzHwA=;
Received: from smtpoutz23.laposte.net ([194.117.213.98] helo=smtp.laposte.net)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icUMZ-008FPQ-1G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 13:06:42 +0000
Received: from smtp.laposte.net (localhost [127.0.0.1])
 by lpn-prd-vrout011 (Postfix) with ESMTP id D2E1E5309C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 Dec 2019 14:06:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail0;
 t=1575464790; bh=QoIoJNvQPoGhf1mEusSBQCFVb/hmuGDTkK983LBNhUA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=IVjMPm635PtB2Yl7mYU30crQdS480bPi7jOE3zVI1J9Xa55WFhJQYQ87r5VIZ2qny
 QYI8Fwe5PpySZWTBSyzmtuS4BYB2cGQCQaUGt9zABQuvyEM5d4CLHDoZ+PiI3cXFV1
 fEbSqLB8Y1fGWVe6DonfAoI8eJ0laFwDU2H2sflNp405NQyyZ2Cy1UKXdi4e1vEJaW
 n4m3bcglSXgT74zsTVnI6l3IYI7li5HROizHwu9s9iNjQG75TbZwD7qAyxPJyMOP8Q
 UvlYgKDRtmZPguV2rA8+fYRbKXqawoyAgqTsISfYiYTdmYMQ2SreNRPiDShLS3xKXG
 +JYSYp4V+F35Q==
Received: from smtp.laposte.net (localhost [127.0.0.1])
 by lpn-prd-vrout011 (Postfix) with ESMTP id C4056530C59
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 Dec 2019 14:06:30 +0100 (CET)
Received: from lpn-prd-vrin003 (lpn-prd-vrin003.prosodie [10.128.63.4])
 by lpn-prd-vrout011 (Postfix) with ESMTP id BE9F25309C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 Dec 2019 14:06:30 +0100 (CET)
Received: from lpn-prd-vrin003 (localhost [127.0.0.1])
 by lpn-prd-vrin003 (Postfix) with ESMTP id B089D4A7260
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 Dec 2019 14:06:30 +0100 (CET)
Received: from [192.168.1.18] (lfbn-mar-1-801-152.w92-150.abo.wanadoo.fr
 [92.150.127.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lpn-prd-vrin003 (Postfix) with ESMTPSA id 4C5A04A7228;
 Wed,  4 Dec 2019 14:06:29 +0100 (CET)
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Matthew Wilcox <willy@infradead.org>
References: <1575281413-6753-1-git-send-email-yangtiezhu@loongson.cn>
 <20191202200302.GN20752@bombadil.infradead.org>
 <357ad021-a58c-ad46-42bd-d5012126276f@loongson.cn>
X-Pep-Version: 2.0
Message-ID: <12554a8e-2899-f03f-ec3d-d4cf35c4dd71@laposte.net>
Date: Wed, 4 Dec 2019 14:06:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <357ad021-a58c-ad46-42bd-d5012126276f@loongson.cn>
Content-Language: en-US
X-VR-FullState: 0
X-VR-Score: -100
X-VR-Cause-1: gggruggvucftvghtrhhoucdtuddrgedufedrudejledggeejucetufdoteggodetrfdotffvucfrrhho
X-VR-Cause-2: fhhilhgvmecunfetrffquffvgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhht
X-VR-Cause-3: shculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthhqredttdefjeenucfhrhhomhep
X-VR-Cause-4: lfgvrghnqdfnohhuihhsuceuihgrshhinhhiuceojhhlrdgsihgrshhinhhisehlrghpohhsthgvrdhn
X-VR-Cause-5: vghtqeenucfkphepledvrdduhedtrdduvdejrdduhedvnecurfgrrhgrmhepmhhouggvpehsmhhtphho
X-VR-Cause-6: uhhtpdhinhgvthepledvrdduhedtrdduvdejrdduhedvpdhhvghloheplgduledvrdduieekrddurddu
X-VR-Cause-7: kegnpdhmrghilhhfrhhomhepjhhlrdgsihgrshhinhhisehlrghpohhsthgvrdhnvghtpdhrtghpthht
X-VR-Cause-8: oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
X-VR-Cause-9: nhhugidqfhdvfhhsqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghp
X-VR-Cause-10: thhtoheplhhinhhugidqfhhstghrhihpthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
X-VR-Cause-11: pegvtghrhihpthhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhf
X-VR-Cause-12: shguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthihhhhitghkshestggr
X-VR-Cause-13: nhhonhhitggrlhdrtghomhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhr
X-VR-Cause-14: tghpthhtohephihutghhrghotdeshhhurgifvghirdgtohhmpdhrtghpthhtohepjhgrvghgvghukhes
X-VR-Cause-15: khgvrhhnvghlrdhorhhgpdhrtghpthhtohepthihthhsohesmhhithdrvgguuhdprhgtphhtthhopehv
X-VR-Cause-16: ihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepfihilhhlhiesihhnfhhr
X-VR-Cause-17: rgguvggrugdrohhrghdprhgtphhtthhopeihrghnghhtihgviihhuheslhhoohhnghhsohhnrdgtnhen
X-VR-Cause-18: ucevlhhushhtvghrufhiiigvpedt
X-VR-AvState: No
X-VR-State: 0
X-VR-State: 0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (jl.biasini[at]laposte.net)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1icUMZ-008FPQ-1G
Subject: Re: [f2fs-dev] [PATCH] fs: introduce is_dot_dotdot helper for
 cleanup
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
From: Jean-Louis Biasini via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jean-Louis Biasini <jl.biasini@laposte.net>
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UGxlYXNlIFVOU1VCU0NSSUJFIE1FIGZyb20gdGhpcyBsaXN0IG9mIHRlbGwgaG93IHRvISEhCgpM
ZSAwMy8xMi8yMDE5IMOgIDAzOjA3LCBUaWV6aHUgWWFuZyBhIMOpY3JpdMKgOgo+IE9uIDEyLzAz
LzIwMTkgMDQ6MDMgQU0sIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+PiBPbiBNb24sIERlYyAwMiwg
MjAxOSBhdCAwNjoxMDoxM1BNICswODAwLCBUaWV6aHUgWWFuZyB3cm90ZToKPj4+IFRoZXJlIGV4
aXN0cyBtYW55IHNpbWlsYXIgYW5kIGR1cGxpY2F0ZSBjb2RlcyB0byBjaGVjayAiLiIgYW5kICIu
LiIsCj4+PiBzbyBpbnRyb2R1Y2UgaXNfZG90X2RvdGRvdCBoZWxwZXIgdG8gbWFrZSB0aGUgY29k
ZSBtb3JlIGNsZWFuLgo+PiBUaGUgaWRlYSBpcyBnb29kLsKgIFRoZSBpbXBsZW1lbnRhdGlvbiBp
cywgSSdtIGFmcmFpZCwgYmFkbHkgY2hvc2VuLgo+PiBEaWQgeW91IGJlbmNobWFyayB0aGlzIGNo
YW5nZSBhdCBhbGw/wqAgSW4gZ2VuZXJhbCwgeW91IHNob3VsZCBwcmVmZXIgdGhlCj4+IGNvcmUg
a2VybmVsIGltcGxlbWVudGF0aW9uIHRvIHRoYXQgb2Ygc29tZSBsZXNzLWludGVyZXN0aW5nIGZp
bGVzeXN0ZW1zLgo+PiBJIG1lYXN1cmVkIHRoZSBwZXJmb3JtYW5jZSB3aXRoIHRoZSBhdHRhY2hl
ZCB0ZXN0IHByb2dyYW0gb24gbXkgbGFwdG9wCj4+IChDb3JlLWk3IEthYnkgTGFrZSk6Cj4+Cj4+
IHFzdHIgLiB0aW1lXzEgMC4wMjA1MzEgdGltZV8yIDAuMDA1Nzg2Cj4+IHFzdHIgLi4gdGltZV8x
IDAuMDE3ODkyIHRpbWVfMiAwLjAwODc5OAo+PiBxc3RyIGEgdGltZV8xIDAuMDE3NjMzIHRpbWVf
MiAwLjAwMzYzNAo+PiBxc3RyIG1hdHRoZXcgdGltZV8xIDAuMDExODIwIHRpbWVfMiAwLjAwMzYw
NQo+PiBxc3RyIC5hIHRpbWVfMSAwLjAxNzkwOSB0aW1lXzIgMC4wMDg3MTAKPj4gcXN0ciAsIHRp
bWVfMSAwLjAxNzYzMSB0aW1lXzIgMC4wMDM2MTkKPj4KPj4gVGhlIHJlc3VsdHMgYXJlIHF1aXRl
IHN0YWJsZToKPj4KPj4gcXN0ciAuIHRpbWVfMSAwLjAyMTEzNyB0aW1lXzIgMC4wMDU3ODAKPj4g
cXN0ciAuLiB0aW1lXzEgMC4wMTc5NjQgdGltZV8yIDAuMDA4Njc1Cj4+IHFzdHIgYSB0aW1lXzEg
MC4wMTc4OTkgdGltZV8yIDAuMDAzNjU0Cj4+IHFzdHIgbWF0dGhldyB0aW1lXzEgMC4wMTE4MjEg
dGltZV8yIDAuMDAzNjIwCj4+IHFzdHIgLmEgdGltZV8xIDAuMDE3ODg5IHRpbWVfMiAwLjAwODY2
Mgo+PiBxc3RyICwgdGltZV8xIDAuMDE3NzY0IHRpbWVfMiAwLjAwMzYxMwo+Pgo+PiBGZWVsIGZy
ZWUgdG8gc3VnZ2VzdCBzb21lIGRpZmZlcmVudCBzdHJpbmdzIHdlIGNvdWxkIHVzZSBmb3IgdGVz
dGluZy4KPj4gVGhlc2Ugc2VlbWVkIGxpa2UgaW50ZXJlc3Rpbmcgc3RyaW5ncyB0byB0ZXN0IHdp
dGguwqAgSXQncyBhbHdheXMKPj4gcG9zc2libGUKPj4gSSd2ZSBtZXNzZWQgdXAgc29tZXRoaW5n
IHdpdGggdGhpcyBiZW5jaG1hcmsgdGhhdCBjYXVzZXMgaXQgdG8gbm90Cj4+IGFjY3VyYXRlbHkg
cmVwcmVzZW50IHRoZSBwZXJmb3JtYW5jZSBvZiBlYWNoIGFsZ29yaXRobSwgc28gcGxlYXNlIGNo
ZWNrCj4+IHRoYXQgdG9vLgo+Cj4gW1NvcnJ5IHRvIHJlc2VuZCB0aGlzIGVtYWlsIGJlY2F1c2Ug
dGhlIG1haWwgbGlzdCBzZXJ2ZXIKPiB3YXMgZGVuaWVkIGR1ZSB0byBpdCBpcyBub3QgcGxhaW4g
dGV4dC5dCj4KPiBIaSBNYXR0aGV3LAo+Cj4gVGhhbmtzIGZvciB5b3VyIHJlcGx5IGFuZCBzdWdn
ZXN0aW9uLiBJIG1lYXN1cmVkIHRoZQo+IHBlcmZvcm1hbmNlIHdpdGggdGhlIHRlc3QgcHJvZ3Jh
bSwgdGhlIGZvbGxvd2luZwo+IGltcGxlbWVudGF0aW9uIGlzIGJldHRlciBmb3IgdmFyaW91cyBv
ZiB0ZXN0IGNhc2VzOgo+Cj4gYm9vbCBpc19kb3RfZG90ZG90KGNvbnN0IHN0cnVjdCBxc3RyICpz
dHIpCj4gewo+IMKgwqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseShzdHItPm5hbWVbMF0gPT0gJy4n
KSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoc3RyLT5sZW4gPCAyIHx8
IChzdHItPmxlbiA9PSAyICYmIHN0ci0+bmFtZVsxXSA9PQo+ICcuJykpCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPiDCoMKgwqDC
oMKgwqDCoCB9Cj4KPiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4gfQo+Cj4gSSB3aWxs
IHNlbmQgYSB2MiBwYXRjaCB1c2VkIHdpdGggdGhpcyBpbXBsZW1lbnRhdGlvbi4KPgo+IFRoYW5r
cywKPgo+IFRpZXpodSBZYW5nCj4KPj4KPj4+ICtib29sIGlzX2RvdF9kb3Rkb3QoY29uc3Qgc3Ry
dWN0IHFzdHIgKnN0cikKPj4+ICt7Cj4+PiArwqDCoMKgIGlmIChzdHItPmxlbiA9PSAxICYmIHN0
ci0+bmFtZVswXSA9PSAnLicpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+PiAr
Cj4+PiArwqDCoMKgIGlmIChzdHItPmxlbiA9PSAyICYmIHN0ci0+bmFtZVswXSA9PSAnLicgJiYg
c3RyLT5uYW1lWzFdID09ICcuJykKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+
ICsKPj4+ICvCoMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4gK30KPj4+ICtFWFBPUlRfU1lNQk9MKGlz
X2RvdF9kb3Rkb3QpOwo+Pj4gZGlmZiAtLWdpdCBhL2ZzL25hbWVpLmMgYi9mcy9uYW1laS5jCj4+
PiBpbmRleCAyZGRhNTUyLi43NzMwYTNiIDEwMDY0NAo+Pj4gLS0tIGEvZnMvbmFtZWkuYwo+Pj4g
KysrIGIvZnMvbmFtZWkuYwo+Pj4gQEAgLTI0NTgsMTAgKzI0NTgsOCBAQCBzdGF0aWMgaW50IGxv
b2t1cF9vbmVfbGVuX2NvbW1vbihjb25zdCBjaGFyCj4+PiAqbmFtZSwgc3RydWN0IGRlbnRyeSAq
YmFzZSwKPj4+IMKgwqDCoMKgwqAgaWYgKCFsZW4pCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FQUNDRVM7Cj4+PiDCoCAtwqDCoMKgIGlmICh1bmxpa2VseShuYW1lWzBdID09ICcuJykp
IHsKPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAobGVuIDwgMiB8fCAobGVuID09IDIgJiYgbmFtZVsx
XSA9PSAnLicpKQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FQUNDRVM7Cj4+
PiAtwqDCoMKgIH0KPj4+ICvCoMKgwqAgaWYgKHVubGlrZWx5KGlzX2RvdF9kb3Rkb3QodGhpcykp
KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUFDQ0VTOwo+Pj4gwqAgwqDCoMKgwqDCoCB3
aGlsZSAobGVuLS0pIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgYyA9ICoo
Y29uc3QgdW5zaWduZWQgY2hhciAqKW5hbWUrKzsKPgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
