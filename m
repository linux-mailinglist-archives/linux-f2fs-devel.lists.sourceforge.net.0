Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8251686D93E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Mar 2024 02:55:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfs7Z-0001DL-6L;
	Fri, 01 Mar 2024 01:55:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rfs7X-0001DE-K6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 01:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UfFhyJQV5J+KQw+ms+53IAuCxU/uP7woEMPVcWwZEZQ=; b=f18qmMnoLzdm7vD80T8ipTw2Fd
 kCG8vGUqtE88+/WBloF1Ejet1RzJn7ACpZoYMbq2HDwO2QAW+KpNP6xkwvYiSYgYUqxF8PwdxOvYP
 bHP/hX49pu5SdWsS450k5ADwCmGoAWt2boVrmH+Ajr1Fw55m0p/zmmOYSoHj84xMQ3io=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UfFhyJQV5J+KQw+ms+53IAuCxU/uP7woEMPVcWwZEZQ=; b=E1ShtMKDcWj5zLALDXvieyW3OO
 B+4SQUaZX0/CjrNML0Bg56ltAYNa+9XHq7IZHqnkOUq4KGDNRC8WtWpjQlnJh+dPNk4I3KkVMSbu0
 ocQgkupyz3QTYkkEc4bHWLCPTiLuRvoJY37+4kabp02e0k2jhtTc7jIZLUBPHfkcZ6+A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfs7U-0004Kr-F0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 01:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 11C4C61645;
 Fri,  1 Mar 2024 01:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC31C433C7;
 Fri,  1 Mar 2024 01:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709258122;
 bh=cbqoixCcz2zE8+F9Pz2JkEG1qy/+t8gYH7RfdkUJYUw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gY/nZbu3L7l92Zt1PCeX1GhBMup6uD9QPIRva9ZiDGX97+d0l1EYQJofw1vcRB/1H
 y9YkGZt5rxsFIbyVDuSiWwW36SDZf1wSiPIHG3H7mXbVJbDo6cfCRumFVZS56qANjF
 UpO5U9w0NDrEMSRedjunrhhkfRHljnZu1Cf1aPSsKjBp9+7uTfST23NDCzbxjqPWj1
 JVhyN5JackZIzxecSMsGRUVFUqTgGE4FpMaK6uVi+srfHD1E0W6R7EFGZzVMWgb/ts
 OOyJOSMg8rElxld5nLthF613+gRap9DLo7rXD6LXOSDNz7Ca8DnNVv+7UNqayhX9nB
 A3sqpI/zI1XJQ==
Message-ID: <3325fdb0-1f21-4ba9-919a-09fa0206f7c5@kernel.org>
Date: Fri, 1 Mar 2024 09:55:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20240226013208.2389246-1-chao@kernel.org>
 <2b81aa6f-db51-4a7c-97ab-2af2c2fea056@kernel.org>
 <CACOAw_yn4m+nEGMEX8RL1xFEaZpzXvjUhUdSoo9d2EeGfzPrAA@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_yn4m+nEGMEX8RL1xFEaZpzXvjUhUdSoo9d2EeGfzPrAA@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/3/1 1:41, Daeho Jeong wrote: > On Thu, Feb 29, 2024
    at 2:11 AM Chao Yu <chao@kernel.org> wrote: >> >> Jaegeuk, Daeho, >> >>
    Any comments on this serials? >> >> Thanks, > > No functional diff [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rfs7U-0004Kr-F0
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix blkofs_end correctly in
 f2fs_migrate_blocks()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8zLzEgMTo0MSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMjksIDIw
MjQgYXQgMjoxMeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IEph
ZWdldWssIERhZWhvLAo+Pgo+PiBBbnkgY29tbWVudHMgb24gdGhpcyBzZXJpYWxzPwo+Pgo+PiBU
aGFua3MsCj4gCj4gTm8gZnVuY3Rpb25hbCBkaWZmZXJlbmNlIGhlcmUsIHNpbmNlIHN0YXJ0X2Js
ayBpcyBhbHdheXMgYWxpZ25lZCB3aXRoCj4gdGhlIHNlY3Rpb24gYWRkcmVzcy4KCllvdSdyZSBy
aWdodC4KCj4gSG93ZXZlciwgdGhpcyBpcyBtb3JlIGNsZWFyIGluIGl0c2VsZi4KClRoYW5rcyBm
b3IgdGhlIHJldmlldyEKCk9uZSBtb3JlIHRoaW5nIGlzLCBJIGZvdW5kIHRoYXQgZmFsbG9jYXRl
KCkgb24gcGlubmVkIGZpbGUgd2lsbCBwcmVhbGxvY2F0ZQphbGlnbmVkIHcvIHNlY3Rpb24tc2l6
ZSB3aGljaCBpcyBhYm91dCBzZXZlcmFsIGh1bmRyZWQgbWVnYWJ5dGUgZm9yIFpVRlMgY2FzZSwK
c2luY2UgY29tbWl0IGUxMTc1ZjAyMjkxMSAoImYyZnM6IGZpeCB0byBhbGlnbiB0byBzZWN0aW9u
IGZvciBmYWxsb2NhdGUoKSBvbgpwaW5uZWQgZmlsZSIpLgoKSXQgbG9va3Mgbm90IG1ha2Ugc2Vu
c2UsIGVzcGVjaWFsbHkgZm9yIGxvZ2NhdCBjYXNlIHdoaWNoIGFjdHVhbGx5IHdhbnQgdG8KcHJl
YWxsb2NhdGUgMk1CIHNwYWNlLCBzbywgd2hhdCBhYm91dCByZXZlcnRpbmcgY29tbWl0IGUxMTc1
ZjAyMjkxMSBhbmQKbG9va2luZyBmb3Igb3RoZXIgc29sdXRpb24gdG8gYXZvaWQgR0Npbmcgb24g
ZnJhZ21lbnRlZCBwaW5uZWQgZmlsZS4KCldoYXQgZG8geW91IHRoaW5rPwoKVGhhbmtzLAoKPiAK
PiBSZXZpZXdlZC1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiAKPiBU
aGFua3MsCj4gCj4+Cj4+IE9uIDIwMjQvMi8yNiA5OjMyLCBDaGFvIFl1IHdyb3RlOgo+Pj4gSW4g
ZjJmc19taWdyYXRlX2Jsb2NrcygpLCB3aGVuIHRyYXZlcnNpbmcgYmxvY2tzIGluIGxhc3Qgc2Vj
dGlvbiwKPj4+IGJsa29mc19lbmQgc2hvdWxkIGJlIChzdGFydF9ibGsgKyBibGtjbnQgLSAxKSAl
IGJsa19wZXJfc2VjLCBmaXggaXQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPgo+Pj4gLS0tCj4+PiAgICBmcy9mMmZzL2RhdGEuYyB8IDUgKysrLS0KPj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+IGluZGV4
IGMyMWI5MmYxODQ2My4uMGM3MjhlODJkOTM2IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9kYXRh
LmMKPj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+PiBAQCAtMzg0MSwxMyArMzg0MSwxNCBAQCBz
dGF0aWMgaW50IGYyZnNfbWlncmF0ZV9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgYmxvY2tf
dCBzdGFydF9ibGssCj4+PiAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19J
X1NCKGlub2RlKTsKPj4+ICAgICAgICB1bnNpZ25lZCBpbnQgYmxrb2ZzOwo+Pj4gICAgICAgIHVu
c2lnbmVkIGludCBibGtfcGVyX3NlYyA9IEJMS1NfUEVSX1NFQyhzYmkpOwo+Pj4gKyAgICAgdW5z
aWduZWQgaW50IGVuZF9ibGsgPSBzdGFydF9ibGsgKyBibGtjbnQgLSAxOwo+Pj4gICAgICAgIHVu
c2lnbmVkIGludCBzZWNpZHggPSBzdGFydF9ibGsgLyBibGtfcGVyX3NlYzsKPj4+ICAgICAgICB1
bnNpZ25lZCBpbnQgZW5kX3NlYzsKPj4+ICAgICAgICBpbnQgcmV0ID0gMDsKPj4+Cj4+PiAgICAg
ICAgaWYgKCFibGtjbnQpCj4+PiAgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4+IC0gICAgIGVu
ZF9zZWMgPSBzZWNpZHggKyAoYmxrY250IC0gMSkgLyBibGtfcGVyX3NlYzsKPj4+ICsgICAgIGVu
ZF9zZWMgPSBlbmRfYmxrIC8gYmxrX3Blcl9zZWM7Cj4+Pgo+Pj4gICAgICAgIGYyZnNfZG93bl93
cml0ZSgmRjJGU19JKGlub2RlKS0+aV9nY19yd3NlbVtXUklURV0pOwo+Pj4gICAgICAgIGZpbGVt
YXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwo+Pj4gQEAgLTM4NTcsNyArMzg1
OCw3IEBAIHN0YXRpYyBpbnQgZjJmc19taWdyYXRlX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBibG9ja190IHN0YXJ0X2JsaywKPj4+Cj4+PiAgICAgICAgZm9yICg7IHNlY2lkeCA8PSBlbmRf
c2VjOyBzZWNpZHgrKykgewo+Pj4gICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJsa29mc19l
bmQgPSBzZWNpZHggPT0gZW5kX3NlYyA/Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgKGJsa2Nu
dCAtIDEpICUgYmxrX3Blcl9zZWMgOiBibGtfcGVyX3NlYyAtIDE7Cj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBlbmRfYmxrICUgYmxrX3Blcl9zZWMgOiBibGtfcGVyX3NlYyAtIDE7
Cj4+Pgo+Pj4gICAgICAgICAgICAgICAgZjJmc19kb3duX3dyaXRlKCZzYmktPnBpbl9zZW0pOwo+
Pj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
