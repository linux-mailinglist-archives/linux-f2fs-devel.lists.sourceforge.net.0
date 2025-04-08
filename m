Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0CA7F4DA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Apr 2025 08:19:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u22IS-00025m-Dh;
	Tue, 08 Apr 2025 06:18:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u22IR-00025a-SE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 06:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JKlHJU9glqTf5Fvvv9I2t956A2TOxp7A6TP+kALgsic=; b=ijEKnxi65GG+QkPq7JQhvK6Z4Q
 pCO9F+UZ1FtB7oyqV+jvxhhl53mScoxX6xdizCBa7glmVk7Yy7tWWJI2g/LJ8cCtVMHJ58EP2FO1F
 4eJIGD3rNpko/VXEQJFWcwJ+nGxXQYAO472jIzjZoWNBGiCBQg9TcadAazR9AWaXAdSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JKlHJU9glqTf5Fvvv9I2t956A2TOxp7A6TP+kALgsic=; b=NMl0xVn4IVdW0RBrO1zT/e9ZWE
 Y4u5s9TphewvlZ0c6ifSdIXP+nFAQeYBx+/yCRs0Hsh2QQxde1X/IpXPh9x9crmxPM/u6ZOTCY46F
 /WxHlLybVGn/+BuzOBy9nuML5qmc8lASdhj4Wiuw1oa+k1i83i0mgrIZLhIals99vTZw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u22IC-0005R2-T0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 06:18:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6140C60007;
 Tue,  8 Apr 2025 06:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102DEC4CEE5;
 Tue,  8 Apr 2025 06:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744093109;
 bh=+W0c1XO3wegAmWuvCj7dL2pRdOIE6yNbwnDWTTP79S0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YSffY29oF/r9FO5lbCewVCXIBDHRsBzzg0qjkRJ+kFpVvVJND0UYMsZPNzyPBGJdC
 vya8boVmTL0Jdma1miVOllrrnHw/cqu6RghlkNktS57GoJKJyKpQ4+ISEmQ/iP1i9i
 Q5QYnHddgKBuZ53sLTyqPwfF4W6SkUwYOuICFDIAGnIxOw6UNV6mykcGP/9nrS04vk
 DqTMjqPNyN+1z+iH6pkJKNDeqICC1lco9zvOEbJUk0rh+59L8qWKBGfnI8aBhW60lq
 zSqQc3HG0zlAV6nl4N/2YY1yVE4gc53z1mwOs5cMkk3KIFj/9qqnEnJ1SuYv6KoGHG
 czFHGBy9+mhhQ==
Message-ID: <608f23ce-56ef-4faf-bee1-3aa89786ed41@kernel.org>
Date: Tue, 8 Apr 2025 14:18:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: uplinkr@airmail.cc
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <e47d4582-60fe-4e55-acfd-d7a10737fa40@kernel.org>
 <f192a85424972b524c1f49fa28a7bd8c@airmail.cc>
Content-Language: en-US
In-Reply-To: <f192a85424972b524c1f49fa28a7bd8c@airmail.cc>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/8/25 14:10, uplinkr@airmail.cc wrote: > Hello, > > I
 made a typo in the URL earlier. It should be
 https://arter97.com/.f2fs-20250406/fsck.log
 . Could you try it, please? Ah, alright. Now, I can access it, thank you.
 Let me check the details in the log. 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u22IC-0005R2-T0
Subject: Re: [f2fs-dev] Resize metadata corruption
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC84LzI1IDE0OjEwLCB1cGxpbmtyQGFpcm1haWwuY2Mgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
SSBtYWRlIGEgdHlwbyBpbiB0aGUgVVJMIGVhcmxpZXIuIEl0IHNob3VsZCBiZSBodHRwczovL2Fy
dGVyOTcuY29tLy5mMmZzLTIwMjUwNDA2L2ZzY2subG9nIC4gQ291bGQgeW91IHRyeSBpdCwgcGxl
YXNlPwoKQWgsIGFscmlnaHQuCgpOb3csIEkgY2FuIGFjY2VzcyBpdCwgdGhhbmsgeW91LiBMZXQg
bWUgY2hlY2sgdGhlIGRldGFpbHMgaW4gdGhlIGxvZy4KClRoYW5rcywKCj4gCj4gVGhhbmtzLgo+
IAo+IE9uIDIwMjUtMDQtMDggMDg6NDMsIENoYW8gWXUgd3JvdGU6Cj4+IE9uIDQvNi8yNSAxNjow
NCwgdXBsaW5rci0tLSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+IEhlbGxvIGV2ZXJ5
b25lLAo+Pj4KPj4+IEkgYW0gaGF2aW5nIHRyb3VibGUgd2l0aCBGMkZTLiBTcGVjaWZpY2FsbHks
IEkgYmVsaWV2ZSBtZXRhZGF0YSBnb3QgY29ycnVwdGVkIHdoZW4gSSByZXNpemVkIGl0LiBJIGhh
dmUgYSA1MTIgR0IgZHJpdmUuIE15IEYyRlMgcGFydGl0aW9uIHdhcyBhcHByb3hpbWF0ZWx5IGxv
Y2F0ZWQgb24gMzY5LTQ5NyBHQiAoMTI4IEdCIHNpemUpLiBVc2luZwo+Pj4gR1BhcnRlZCwgSSBy
ZXNpemVkIGl0IHRvIDAuNS00OTcgR0IuIFdoaWxlIHRoZSBwYXJ0aXRpb24gcmVzaXppbmcgd2Vu
dCB0aHJvdWdoIHN1Y2Nlc3NmdWxseSwgZmlsZXN5c3RlbSByZXNpemluZyBpbml0aWFsbHkgZmFp
bGVkIHdpdGggIk1vdW50IHVuY2xlYW4gaW1hZ2UgdG8gcmVwbGF5IGxvZyIuIEkgaGF2ZSBkb25l
IHRoYXQgYW5kIHJldHJpZWQKPj4+IHJlc2l6aW5nLgo+Pj4KPj4+IEFmdGVyd2FyZHMsIGhvd2V2
ZXIsIGZzY2sgc3RhcnRlZCBnaXZpbmcgb3V0IGEgbG90IG9mIGVycm9ycywgYXQgb25lIHBvaW50
IGl0IGFza2VkIGlmIEkgd2lzaGVkIHRvIHJlc3RvcmUgbG9zdCBkYXRhLCB3aGljaCBJIGFncmVl
ZCB0by4gTG9ncyBzcGVjaWZpZWQgYSBsb3Qgb2YgbXkgZmlsZXMgKHdoaWNoIEkgY291bGQgdGVs
bCBieQo+Pj4gZmlsZW5hbWVzKSBhbmQgbWlkLXdheSB0aHJvdWdoIHRoZSBwcm9jZXNzLCBpdCBz
ZWdmYXVsdGVkLiBOb3csIHdoZW4gSSBydW4gZnNjaywgbm8gZmlsZXMgYXJlIGFza2VkIHRvIGJl
IHJlc3RvcmVkLCBhbmQgaXQgY29tcGxldGVzIHN1Y2Nlc3NmdWxseS4gSG93ZXZlciwgd2hlbiBJ
IGF0dGVtcHQgdG8gbW91bnQgaXQsIEkgZ2V0IGFuIGVycm9yCj4+PiBzYXlpbmcgIlN0cnVjdHVy
ZSBuZWVkcyBjbGVhbmluZyIuCj4+Pgo+Pj4gQ291bGQgc29tZW9uZSBoZWxwIG1lIHJlc3RvcmUg
bXkgbWV0YWRhdGEgKGF0IGxlYXN0LCBsb25nIGVub3VnaCB0byBleHRyYWN0IG15IGZpbGVzKT8g
VGhhbmtzLgo+Pj4KPj4+IGRtZXNnIGxvZ3M6Cj4+Pgo+Pj4gW8KgwqAgOTYuMTg0MTI3XSBGMkZT
LWZzIChudm1lMG4xcDUpOiBNaXNtYXRjaCB2YWxpZCBibG9ja3MgNzY5IHZzLiA2OAo+Pj4gW8Kg
wqAgOTYuMTg4MDUwXSBGMkZTLWZzIChudm1lMG4xcDUpOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSBG
MkZTIHNlZ21lbnQgbWFuYWdlciAoLTExNykKPj4+Cj4+PiBmc2NrLmYyZnMgLS1kcnktcnVuIC1k
IDMgbG9nczogaHR0cHM6Ly9hcnRlci5jb20vLmYyZnMtMjAyNTA0MDYvZnNjay5sb2cKPj4KPj4g
SGVsbG8sCj4+Cj4+IENvdWxkIHlvdSBwbGVhc2UgdXBsb2FkIGZzY2subG9nIGluIGJ1Z3ppbGxh
Lmtlcm5lbC5vcmcsIG9yIHNvbWV3aGVyZSBlbHNlPwo+PiBJIGNhbiBub3QgZG93bmxvYWQgaXQg
ZnJvbSBhYm92ZSBsaW5rIGFkZHJlc3MsIHNvcnJ5Lgo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4K
Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKPj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
