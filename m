Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEySGB7Y02nUnAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 17:58:22 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B692C3A5004
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 17:58:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PUJTzCLsHe8zghdJLbXtARHRIfDAEmHdG9MusL8V9U=; b=dHbgD26qqVrXqqGwbOiiwuTXpR
	rh22VKU2Wq3Mioytbp2lPEiVq3FPk3Dh6ClUtbTUC34LkeALKNuvZ8+RShsU9H/8Bv8leMgXvbVVH
	k1WoF815u5bBJPFW4LqHoOJJ7GIJmiw9rMLjXBU1aLyIRCkSNUnIT0Zhqpjm7j6d+fd0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w9mL4-0000A1-SH;
	Mon, 06 Apr 2026 15:58:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w9mL3-00009q-Gw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 15:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GAKZi0WyVm9uZHnaDDJm7DqfteioOwSgz2J8BmSgqTk=; b=mR73w8wQS/t3HxEwKLg+AsCCTc
 7Ty90N4WRfx70ZmjUldLAOxyPg1oR7WovlTP23UY7S1aaGkfpqKThdDNFlkv6LUTMdK0FsS27Y7Md
 g+3JoXedgv4N+HKyFFYinJUrtdPJjL5QHOLyfHNKIfbD3x+Ag+3wH/6B8Ul+bXBjppgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GAKZi0WyVm9uZHnaDDJm7DqfteioOwSgz2J8BmSgqTk=; b=TLKFIQcb9G6IjKnZv+AhfY/ILy
 YGWn9QklTMLaniW/l1Nv2ehmhxKJpJrJCbPg5UBmnIEJIgACaz/MfHszA6LXyEwwDbv25MMqdF/+c
 +UEekMZig4FU5AJXbPJfr/KEXBVEL5GXF76GVi4XS2W7q0nkFl3Fx5SGWfdl4FeWYqJc=;
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w9mL2-0004LX-Sn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 15:58:09 +0000
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-9539b80db32so682643241.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Apr 2026 08:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775491078; cv=none;
 d=google.com; s=arc-20240605;
 b=jo/P0KreODp1tXue7f6wYdqvE717wyefYswrdXdXSVISVuna7PAyjcHOhon42NWj+Q
 I8FqZf34df/T2F4r0v/ItIHNRdyYCEx7rhpWaPpmhUdwPL8UBJblCjQxtm//Nzcndgfk
 v7qNXSZ/IBLO0TIggoD2QdWPfs53+UVW/QWn3gVeqyB7IIsWJmvjMvO9osCtCVVKP730
 VYb5Cvt3xxEyydXrtezxxWHZbUlvKmsSFddv+o6vWJumWVrcUvECr09HdCXmXIrTA9bO
 SIKMDy8+JJGI6lb1GjemcCzf6wQfVbxkOKi3isFhOaTfPmP1NUhRtMhVXWzZtfhiXzkr
 cjtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=GAKZi0WyVm9uZHnaDDJm7DqfteioOwSgz2J8BmSgqTk=;
 fh=+r9LD0XZ9dESPW/fevbWo9IU7QkCxFp/UtCiKWkduT8=;
 b=TFvvfoMzSHMHnATMIjkR+hgYsF7dS0vOoAfcfyvh2IXPXODiRpj3exbhp5g/5LBK8T
 Cv+etczfuvXeZ+L/uGUw2j+II2XKx0Z4xHLj0zqUQZGM9mfXfGVhpm8329ys7S5YMK/I
 crRgX54oq1NOvbQxPShopYvtQTsj4+HZWw0YXuk4P+UtyuOLmi0BTTY6pAi9xFZ/1dUC
 gfLdYFbYT1WFQ3bFY19Jf/kJrFVoSWbqJeHJkwXRdrWFT4bhYBscsYeMJNPhaJ23R8Iq
 y6e3iRY+CGYJro0T8JOXXJJRQYGNmTfTHtsRkABJ1gn45q7zccz4UZ9/R5t4EblyvMQ9
 v/Bw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775491078; x=1776095878; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAKZi0WyVm9uZHnaDDJm7DqfteioOwSgz2J8BmSgqTk=;
 b=A2Kk2uL1iFoyUf+2eK0T2ejDhmRQisHyAwRwcmxvXtYlS3eQuFz8nf2LMr4RUXwo6o
 oqFl72uV8jeCLUhtJrv56HC9OWhQXcThXfmRnTdQmEhMnPd1HNFyBmvGPkyI7jJeA9k8
 Dha+WV2dU1WxIJMe8WTevG4nx8ZTnsfjMBcE8CeuRpQ2ON413pzZnguPInHOsiTKLYUE
 Zoj3ErfCHGBWe3E794yzvuGxXpOvpabKmrnk+x49gG1QKXpfXC3oyqedMkzHxq3pyQEZ
 kh9JNmcUUJRQ5LBBEww6/LXAoH/scgTOeuu7Yh4l1t7APaN5X5gcCFNCCFMiOMaycV3m
 ZKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775491078; x=1776095878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GAKZi0WyVm9uZHnaDDJm7DqfteioOwSgz2J8BmSgqTk=;
 b=m4m+YuvH/ksT1sNDDT+fsVsf0cEKqL/deNPZM81iQVi0nqVD4u2MqTeAqqLJ84r3oP
 kt9gBY7EQ6IH03XMAS1oD0iQ+ll6fCUDjlb0H+jnO4f4ecX9FLk4GXWhBQBGxVFAw0hi
 UyFDNJMNJQvL5FLfW1Mkkagiuk4uTY9AiFuGGvO4+Mf0apx31l341Jm8upiGguvVomFB
 I+U0B7rJczeQbHcVaUajB0fgNrOZWMovyTycN+vMDVWgdMhasy8xXQdhvciOYnmBug8O
 +i3GPg9NSNOnvzVleWRsIKyY0xyLI6gBn1TI6KucNvcjPKWsLz9dxg+6vD+xcrLnkb19
 mUPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFIJny60KYRd7ctEs+nSnG820hdVRn0J3Q96TkiwkwAXULQIey3EL/m4pLae5/kx557nPSVyM4ah8dvSRlJcTU@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxyco0fWzlBcMA7UpLf/2p11AW7DCrtlTXxafQ5W2H+wKGZckVA
 M7bPs/C9P3gIRKdjW8iobJdXwdo/O/XSA5Ja5AvwYh5NXaTd+vPwxpFXmZaCtMGL0CA69ICAnRg
 k2wUgY5uKCXsevC7Je2YX4AvO1LZZO1A=
X-Gm-Gg: AeBDieuIrDIZ+mH1mneXiDVuXUn9LxK1G/qg6HutXkSdIHFYu75ygil+ZvwYN2Kacgv
 oXyZEGtWAVMA75sTi9gOVsNF1ZBRduhrsk+8sbk22u1gp0KXNd7+cQzuJ8Op9oHwUkCYph2VzWg
 9nxQaFMHjOc6qp0a4GzBgHLYyY5GsIh0jqT1cQl3z1Sn7Zo+WEx9mumDUj8NFuls6HzzCGVjysb
 GsWb/zLmkCbDd73ogPENZ0Hp6wEOoLyEAvwrJFu5ccOARKtjbq/Bwg9NyheX/40VkFcul7+s3+o
 hITOADx8ectrYuTn+gZ8HS7Br9u1k3mVbborJ3vIZPku/U5kGDWhpfVZ6lGDf/YdOC1/DXD8X8+
 XCz5r8o0=
X-Received: by 2002:a05:6102:4412:b0:5ff:2569:cfe7 with SMTP id
 ada2fe7eead31-605a4d90777mr4406483137.10.1775491077863; Mon, 06 Apr 2026
 08:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260406154940.2407853-1-jaegeuk@kernel.org>
In-Reply-To: <20260406154940.2407853-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 6 Apr 2026 08:57:46 -0700
X-Gm-Features: AQROBzDaDNk_kTv0OxFE44fhL--W3rFu0uChZJZWDyxB8Z1GqyK4PJnLOA1idVc
Message-ID: <CACOAw_wVA1QvaWJS4ShVbEm97iK1_MpT6p4k8ZaLmTy1R7DQrg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 6,
 2026 at 8:56 AM Jaegeuk Kim via Linux-f2fs-devel
 wrote: > > Let's check mmmap writes onto the large folio. typo? mmap? > >
 Signed-off-by: Jaegeuk Kim > --- > fs/f2fs/file.c | 2 +- > 1 file changed,
 1 insertion(+), 1 deletion(-) > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 > index 2c4880f24b54..edfc3a374c40 10064 [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.48 listed in wl.mailspike.net]
X-Headers-End: 1w9mL2-0004LX-Sn
Subject: Re: [f2fs-dev] [PATCH] f2fs: do not support mmap write for large
 folio
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: B692C3A5004
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBBcHIgNiwgMjAyNiBhdCA4OjU24oCvQU0gSmFlZ2V1ayBLaW0gdmlhIExpbnV4LWYy
ZnMtZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToK
Pgo+IExldCdzIGNoZWNrIG1tbWFwIHdyaXRlcyBvbnRvIHRoZSBsYXJnZSBmb2xpby4KCnR5cG8/
IG1tYXA/Cgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9y
Zz4KPiAtLS0KPiAgZnMvZjJmcy9maWxlLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5j
IGIvZnMvZjJmcy9maWxlLmMKPiBpbmRleCAyYzQ4ODBmMjRiNTQuLmVkZmMzYTM3NGM0MCAxMDA2
NDQKPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4gQEAgLTgy
LDcgKzgyLDcgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZjJmc192bV9wYWdlX21rd3JpdGUoc3RydWN0
IHZtX2ZhdWx0ICp2bWYpCj4gICAgICAgICBpbnQgZXJyID0gMDsKPiAgICAgICAgIHZtX2ZhdWx0
X3QgcmV0Owo+Cj4gLSAgICAgICBpZiAodW5saWtlbHkoSVNfSU1NVVRBQkxFKGlub2RlKSkpCgpE
aWQgeW91IHJlbW92ZSB0aGlzIGludGVudGlvbmFsbHk/Cgo+ICsgICAgICAgaWYgKG1hcHBpbmdf
bGFyZ2VfZm9saW9fc3VwcG9ydChpbm9kZS0+aV9tYXBwaW5nKSkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIFZNX0ZBVUxUX1NJR0JVUzsKPgo+ICAgICAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0
KGlub2RlLCBGSV9DT01QUkVTU19SRUxFQVNFRCkpIHsKPiAtLQo+IDIuNTMuMC4xMjEzLmdkOWEx
NDk5NGRlLWdvb2cKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
