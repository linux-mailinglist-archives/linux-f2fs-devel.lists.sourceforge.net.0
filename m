Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD33C129A9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Oct 2025 02:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpuif+jSpP08oW/hQUxn2kO7bajef/i9M2/lpbjvkOQ=; b=N+NEK3ImeAmtHFqF7THcAgtuA8
	e2uoTksin5x3O3CjKBoqX3BXkItt/Ru29l5Sb/yYm25YV+k15TPmIrtV6flYA94WWiTbhSINQVZ9Q
	Y6SMeEbLN7JArpW6EOXWUczW02k0ea0w/Y6KuNJV6nEUWjqZpUvWmg4/6oOKMzBJb+5M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDYxD-0008N2-Dd;
	Tue, 28 Oct 2025 01:56:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDYxC-0008Mt-4Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 01:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ak4SrxJIdGZE4R/aYqE4KK8+v0JSFYBqXkRfLo9vSZI=; b=OhpMCkZ5qmfGqLA0DPlb05xp0F
 71uIaQ4hJKKIJKn9Lpvs8msAK1ufbBOizoSwebwfGP51c0HR+vI3FRgGYS6f9aveHeP9w2XiaZ70r
 hYIAvwRKM0aa/AZ7dmSeQY+Ciu9OvolIcjHb7g+pbMflUWGwYL/+l4TqmQPgquGFXNOQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ak4SrxJIdGZE4R/aYqE4KK8+v0JSFYBqXkRfLo9vSZI=; b=J60KfuBAKn1dK1mQb+iIC27Wzp
 1HcwYYTVSsU6Blq9do9T3ZgnwkzD2iv+XfGySXXWGjxX7NNJUFP2wI/SDrzpnd41KJb+wgvJkPoqY
 RgrC1tXiNu8E8CeKlp80fb1BXME/ZAGPn12iI9qRqHCcRB4Rcj865AJpEgk8VG9QDwE8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDYxB-0007UV-IT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Oct 2025 01:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D64066051B;
 Tue, 28 Oct 2025 01:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56839C4CEF1;
 Tue, 28 Oct 2025 01:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761616602;
 bh=g2yyvoN+1HNOmdyvaXIarerpwTT69j+s8Bc+DILxvjI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=iTaDNk+aZqktgIHMAvwTEZ+sCp+1KPnLqdtWZnXIf//ShAfEgm8my91TerFAY4ROi
 3lpeXg3a/tvo+Z11E8FZBYb+dyIKUVcPXHJmw2gHQIoxj6dxJGQQ9bWmeLDedQcHbd
 0eysn84yPKkKTIH03mr99MHmCZwd/dqM74Y6v19UF7g4zOpA8oVSNqhtKwDd+vaqpu
 iAJ3LNAA6CKcfo60D0TKEmc2ffhoaVduudmS5bzJUTGd6A9rh9Myy2w+ZtTWe2qHt9
 HNwlsKC31qImNA+2+KpT+XPZF2xA2r7nso/VJ9HT/IRfe0NHHScelDgw78T9so6Aur
 ggqYEVV8xDt/g==
Message-ID: <8ad9e792-7b0a-4c93-8ad9-3f13e6f8614f@kernel.org>
Date: Tue, 28 Oct 2025 09:56:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Deepanshu Kartikey <kartikey406@gmail.com>, jaegeuk@kernel.org
References: <20251027130635.13739-1-kartikey406@gmail.com>
Content-Language: en-US
In-Reply-To: <20251027130635.13739-1-kartikey406@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/27/25 21:06, Deepanshu Kartikey wrote: > F2FS can mount
 filesystems with corrupted directory depth values that > get runtime-clamped
 to MAX_DIR_HASH_DEPTH. When RENAME_WHITEOUT > operations are [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDYxB-0007UV-IT
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: invalidate dentry cache on failed
 whiteout creation
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: syzbot+632cf32276a9a564188d@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMjcvMjUgMjE6MDYsIERlZXBhbnNodSBLYXJ0aWtleSB3cm90ZToKPiBGMkZTIGNhbiBt
b3VudCBmaWxlc3lzdGVtcyB3aXRoIGNvcnJ1cHRlZCBkaXJlY3RvcnkgZGVwdGggdmFsdWVzIHRo
YXQKPiBnZXQgcnVudGltZS1jbGFtcGVkIHRvIE1BWF9ESVJfSEFTSF9ERVBUSC4gV2hlbiBSRU5B
TUVfV0hJVEVPVVQKPiBvcGVyYXRpb25zIGFyZSBwZXJmb3JtZWQgb24gc3VjaCBkaXJlY3Rvcmll
cywgZjJmc19yZW5hbWUgcGVyZm9ybXMKPiBkaXJlY3RvcnkgbW9kaWZpY2F0aW9ucyAodXBkYXRp
bmcgdGFyZ2V0IGVudHJ5IGFuZCBkZWxldGluZyBzb3VyY2UKPiBlbnRyeSkgYmVmb3JlIGF0dGVt
cHRpbmcgdG8gYWRkIHRoZSB3aGl0ZW91dCBlbnRyeSB2aWEgZjJmc19hZGRfbGluay4KPiAKPiBJ
ZiBmMmZzX2FkZF9saW5rIGZhaWxzIGR1ZSB0byB0aGUgY29ycnVwdGVkIGRpcmVjdG9yeSBzdHJ1
Y3R1cmUsIHRoZQo+IGZ1bmN0aW9uIHJldHVybnMgYW4gZXJyb3IgdG8gVkZTLCBidXQgdGhlIHBh
cnRpYWwgZGlyZWN0b3J5Cj4gbW9kaWZpY2F0aW9ucyBoYXZlIGFscmVhZHkgYmVlbiBjb21taXR0
ZWQgdG8gZGlzay4gVkZTIGFzc3VtZXMgdGhlCj4gZW50aXJlIHJlbmFtZSBvcGVyYXRpb24gZmFp
bGVkIGFuZCBkb2VzIG5vdCB1cGRhdGUgdGhlIGRlbnRyeSBjYWNoZSwKPiBsZWF2aW5nIHN0YWxl
IG1hcHBpbmdzLgo+IAo+IEluIHRoZSBlcnJvciBwYXRoLCBWRlMgZG9lcyBub3QgY2FsbCBkX21v
dmUoKSB0byB1cGRhdGUgdGhlIGRlbnRyeQo+IGNhY2hlLiBUaGlzIHJlc3VsdHMgaW4gbmV3X2Rl
bnRyeSBzdGlsbCBwb2ludGluZyB0byB0aGUgb2xkIGlub2RlCj4gKG5ld19pbm9kZSkgd2hpY2gg
aGFzIGFscmVhZHkgaGFkIGl0cyBpX25saW5rIGRlY3JlbWVudGVkIHRvIHplcm8uCj4gVGhlIHN0
YWxlIGNhY2hlIGNhdXNlcyBzdWJzZXF1ZW50IG9wZXJhdGlvbnMgdG8gaW5jb3JyZWN0bHkgcmVm
ZXJlbmNlCj4gdGhlIGZyZWVkIGlub2RlLgo+IAo+IFRoaXMgY2F1c2VzIHN1YnNlcXVlbnQgb3Bl
cmF0aW9ucyB0byB1c2UgY2FjaGVkIGRlbnRyeSBpbmZvcm1hdGlvbiB0aGF0Cj4gbm8gbG9uZ2Vy
IG1hdGNoZXMgdGhlIG9uLWRpc2sgc3RhdGUuIFdoZW4gYSBzZWNvbmQgcmVuYW1lIHRhcmdldHMg
dGhlCj4gc2FtZSBlbnRyeSwgVkZTIGF0dGVtcHRzIHRvIGRlY3JlbWVudCBpX25saW5rIG9uIHRo
ZSBzdGFsZSBpbm9kZSwgd2hpY2gKPiBtYXkgYWxyZWFkeSBoYXZlIGlfbmxpbms9MCwgdHJpZ2dl
cmluZyBhIFdBUk5JTkcgaW4gZHJvcF9ubGluaygpLgo+IAo+IEV4YW1wbGUgc2VxdWVuY2U6Cj4g
MS4gRmlyc3QgcmVuYW1lIChSRU5BTUVfV0hJVEVPVVQpOiBmaWxlMiDihpIgZmlsZTEKPiAgICAt
IGYyZnMgdXBkYXRlcyBmaWxlMSBlbnRyeSBvbiBkaXNrIChwb2ludHMgdG8gaW5vZGUgOCkKPiAg
ICAtIGYyZnMgZGVsZXRlcyBmaWxlMiBlbnRyeSBvbiBkaXNrCj4gICAgLSBmMmZzX2FkZF9saW5r
KHdoaXRlb3V0KSBmYWlscyAoY29ycnVwdGVkIGRpcmVjdG9yeSkKPiAgICAtIFJldHVybnMgZXJy
b3IgdG8gVkZTCj4gICAgLSBWRlMgZG9lcyBub3QgY2FsbCBkX21vdmUoKSBkdWUgdG8gZXJyb3IK
PiAgICAtIFZGUyBjYWNoZSBzdGlsbCBoYXM6IGZpbGUxIOKGkiBpbm9kZSA3IChzdGFsZSEpCj4g
ICAgLSBpbm9kZSA3IGhhcyBpX25saW5rPTAgKGFscmVhZHkgZGVjcmVtZW50ZWQpCj4gCj4gMi4g
U2Vjb25kIHJlbmFtZTogZmlsZTMg4oaSIGZpbGUxCj4gICAgLSBWRlMgdXNlcyBzdGFsZSBjYWNo
ZTogZmlsZTEg4oaSIGlub2RlIDcKPiAgICAtIFRyaWVzIHRvIGRyb3Bfbmxpbmsgb24gaW5vZGUg
NyAoaV9ubGluayBhbHJlYWR5IDApCj4gICAgLSBXQVJOSU5HIGluIGRyb3BfbmxpbmsoKQo+IAo+
IEZpeCB0aGlzIGJ5IGV4cGxpY2l0bHkgaW52YWxpZGF0aW5nIG9sZF9kZW50cnkgYW5kIG5ld19k
ZW50cnkgd2hlbgo+IGYyZnNfYWRkX2xpbmsgZmFpbHMgZHVyaW5nIHdoaXRlb3V0IGNyZWF0aW9u
LiBUaGlzIGZvcmNlcyBWRlMgdG8KPiByZWZyZXNoIGZyb20gZGlzayBvbiBzdWJzZXF1ZW50IG9w
ZXJhdGlvbnMsIGVuc3VyaW5nIGNhY2hlIGNvbnNpc3RlbmN5Cj4gZXZlbiB3aGVuIHRoZSByZW5h
bWUgcGFydGlhbGx5IHN1Y2NlZWRzLgo+IAo+IFJlcHJvZHVjZXI6Cj4gMS4gTW91bnQgRjJGUyBp
bWFnZSB3aXRoIGNvcnJ1cHRlZCBpX2N1cnJlbnRfZGVwdGgKPiAyLiByZW5hbWVhdDIoZmlsZTIs
IGZpbGUxLCBSRU5BTUVfV0hJVEVPVVQpCj4gMy4gcmVuYW1lYXQyKGZpbGUzLCBmaWxlMSwgMCkK
PiA0LiBTeXN0ZW0gdHJpZ2dlcnMgV0FSTklORyBpbiBkcm9wX25saW5rKCkKPiAKPiBGaXhlczog
N2UwMWU3YWQ3NDZiICgiZjJmczogc3VwcG9ydCBSRU5BTUVfV0hJVEVPVVQiKQo+IFJlcG9ydGVk
LWJ5OiBzeXpib3QrNjMyY2YzMjI3NmE5YTU2NDE4OGRAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNv
bQo+IENsb3NlczogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPTYzMmNm
MzIyNzZhOWE1NjQxODhkCj4gU3VnZ2VzdGVkLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDIyMjMzMzQ5LjEwMjcy
OC0xLWthcnRpa2V5NDA2QGdtYWlsLmNvbS8gW3YxXQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnCj4gU2lnbmVkLW9mZi1ieTogRGVlcGFuc2h1IEthcnRpa2V5IDxrYXJ0aWtleTQwNkBnbWFp
bC5jb20+CgpSZXZpZXdlZC1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKVGhhbmtzLAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
