Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8BxsBIhWMWpWhAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 15:58:32 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FE96902A4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 15:58:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Gn0xQCoC;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=b67bEtcb;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=WgfuXNv5;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=q9GJQLr4;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHeb8FHHVs/OU52TUo9sF/Ay9mmWPOcSuc0c+0OdeLE=; b=Gn0xQCoCQPf1n2YsJOecZ2RQe+
	N1fOa83iYWzS9u5jfuyz1wZosRPIPIqV3Px6ggvXXGmoBqdnmEreuCNoNQ9dhZpSKxbZ0UW98CAeF
	rTZrcnxRNVF4X5+C634NNIDdFLojdElvsGEarK5kMkivpvXQpt/sZnPsFn1fCtePbIE0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZUJ1-000753-B8;
	Tue, 16 Jun 2026 13:58:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wZUIz-00074v-Rf
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 13:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xANXsimQj4lOW5kdpkUV4WKzN9d0VNIeAtrl02TVKoo=; b=b67bEtcbcsRAI553W9MG54QCLH
 b60RJNODSsIjskM04qB3ooScVIWOyuwKbyR3IJNdaWQntCkw0ZdVk9Y9wRDbr5KwaCK06FPDOys8I
 SdUlCbg/JXX2wSYKafFn8vubT7mBH6pLX2yysDiqwHoK+5yQ2gH+qLLHTo0LCLcUYCxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xANXsimQj4lOW5kdpkUV4WKzN9d0VNIeAtrl02TVKoo=; b=WgfuXNv5V7WA5mLZzgJK4RNup/
 BDCyPRANYi71vK/xyL3erCF9b3SQR1rwdrbc1FUWIyQj2Gz/XaGNOl5JsVbZQi78/3X0GKkb20OFq
 LDGxRo2LqVjtopCA+mCnv+ZZwfJxnOiQ7TN9V4UTGgSJXVJl410fqyp3/5TL40Lg7CAs=;
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZUIy-0002Th-Pa for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 13:58:18 +0000
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5aa5edf347eso3054943e87.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 06:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781618286; cv=none;
 d=google.com; s=arc-20240605;
 b=SL05NEjwWW8AUUBsJgN8tuy+pjHVt+Dz5R6vnjlP39Jo/Gao7D1ITtF/elU4CyI+0K
 K4MzqhQwP/bLnlGS1QcXdCrYGDBAq7NUvyzFH2YEQAL2vlSX3v9bQLkw+9306TX5zL43
 yL54ExlOcJD3qFUS4GnQgLcvEogcxlGJQpc1vMYlC9pO27QEN+G8drIJIpxKXityauGL
 v2ukPonxCAj9E2KzZcpFaEf83/P/7HDneh+NhhQXoq0/tDn8dy/cQdTsq4AXfDRJBcwS
 W4swCd17xNdcTtyLiPHxYvJzRH1I7EgSOSQGLiB8IIfaJLGPMAT/iDwqyPlMSHdY8QuM
 JmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xANXsimQj4lOW5kdpkUV4WKzN9d0VNIeAtrl02TVKoo=;
 fh=X47AvQnmD/pEMYLmy5QP5rQk+MfDYFtC4eFNYWT7ZhM=;
 b=JZ41iOc3VrzoC4gkxlumfYG6CnohvYQIHgv2YCIZvSPhhfrlJZPeHl8uJ0pZiF31hb
 hdicIw0uD6N5p6HIVMzWhCzWZhKO7IavJwIqjPdu0hDn+vFHnk0Lq/ZdxLdumFtXrRtr
 65rnEDiiKKU6+JYIHkS7cbiZ3T/iy6hzT5OlD1jERG+v6VeDYVz7W0+cgtolc/Q7V+np
 YrmtLNSnsxbeRmlW4GXNPrJ4Y42+HNl3AQAjFlcpxpzWxsOaMEHrdKpihfSb1BwnuV2z
 Rmo12EalGSs1sQHKihvtSLyzyigtFnn3izfLMuPerqPomvtzl6p9Nwlkvu2MyYVOK8Vn
 a6Aw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781618285; x=1782223085; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xANXsimQj4lOW5kdpkUV4WKzN9d0VNIeAtrl02TVKoo=;
 b=q9GJQLr4EcgoKwlwuyYv/TiLpSw4W+oXoTeJ97nOKZCj6gdfsLkXFhFpqNHb/2njWa
 p8mhsHL4gyVUCWT3SZw1N1Secim8NDVzFudB7KiK4Fn4UsNLutvc1YMZvDvSET/p6PiS
 TS+6e9blZJYEkcFD65fbf0oeMqTT4yoIVCMX2HpPvoCrg+TXjGL9SKET16tZyQK05cE/
 jIJK8gw0DeTN8cj3IXuV2CwI8KRu8rHsFmpoo2nnXCbJ7ssMfpcNkowcozFTfR5zIMvw
 BxrMk6+MHt/W3Aw4CoOwrRt5Xavbi54wmeylfi198c1vyaLFNDEkpBm/XK5ywmxLJn0H
 E5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781618286; x=1782223086;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xANXsimQj4lOW5kdpkUV4WKzN9d0VNIeAtrl02TVKoo=;
 b=CmU/y5JodSa9Ffe+fH6+b7d9169lQ2wrI55OPPWiQXFYYoQSJPX6kdL6TN+1g/SwWT
 vOVoNQCumWImwWnLTm3CqwX3wh5C9m1+GSgX2yIBlqUEaxMxnlxIlQdNn+w+K+wzpwWO
 U1PCkU6x2VgKrpZxHIYf4FaEZJw2f/NJGXqt4viLdtIESg6rY6rmodROu16dmfi+WZN8
 hikBHGT+UZTpgj+LcOWT59hnHSdJITmCE/u/86epGOdQZqzkS6jEEZWGzeQg66bNYrbZ
 uQTXrBeiPQDidT3NFkehXe9y3JcIQfN7A8SVdQ80SsADeifeXNgap4mGOnvuXEHgHGE9
 8cqg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Xx3nTIrGtDcsy2ZzbMJ1lB+Ni55ihKFxyQN9ZsctxWZ8jOIG6N8Px4QPrnYrNPOGoIrrc/SuhlyWxki2+3W+i@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy9F2cB5TPcqbUQVW6NSypxGurHfSRAfYPLU/gkRkf0Rx4sVBrp
 g+iTLtJYRkUJNRl3svyxQYaNtW0w4jsivqV/twkftG9Cb4HrgC1tltBEbciru/aqQv6yRga4JyS
 48ZRvhtFSVpFeSWJGHWzXByQXX0+ftNE=
X-Gm-Gg: Acq92OGpkxpZsnn0wGnBCQ7r2w+z389/WMZnQbuW35RO/hIoX2lf6tRD5XwtZPyZbca
 l9H/KNISu5JOJxqeifaMcm0TZXuq9P+o4TGjFGX0Krm+TY7hrxGNQvrnkED/L/JGJlQIVBK4qAe
 1l1Au0mkwA3OPVGzDffC8VftO9Z9tW/fDG8Nr1gvc7eGZCrqjNhL5npPLmgFBukbS4lCwN2bNdQ
 N3WoovDg51yJ6Hp16p/UZlE3oBWYo1kL7uLgUMbBtrdG8gi3Avzc1L6A5KT/wtWYbAaOd2p0e1b
 4qjo4N58
X-Received: by 2002:a05:6512:3e23:b0:5ad:3a58:1bd2 with SMTP id
 2adb3069b0e04-5ad3a581d1fmr2730607e87.3.1781618285276; Tue, 16 Jun 2026
 06:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260525061456.231710-1-qiwenjie@xiaomi.com>
 <ajBfZSpf2I8s67ze@google.com>
 <CAGFpFsS0Edkcg7WTD+nbnqBwc6yiyM2=nWcNFYjYUA5NfeOuNw@mail.gmail.com>
In-Reply-To: <CAGFpFsS0Edkcg7WTD+nbnqBwc6yiyM2=nWcNFYjYUA5NfeOuNw@mail.gmail.com>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Tue, 16 Jun 2026 21:57:54 +0800
X-Gm-Features: AVVi8Ce2umuF7sqBwBrdgUeK0zXCyTvzdQ9tquVvRBDmCyWN9isqnE1_nl974yA
Message-ID: <CAGFpFsRQmvqTY=W9_ofF93hzQAi7rF9tS3zUiLWixfSiYd4WBw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 16, 2026 at 9:04 PM Wenjie Qi wrote: > > I see.
 The old patch assumed compressed writeback should follow the > F2FS_WB_CP_DATA
 path because the current code accounts it that way. > > Aft [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.50 listed in wl.mailspike.net]
X-Headers-End: 1wZUIy-0002Th-Pa
Subject: Re: [f2fs-dev] [PATCH] f2fs: stop checkpoint on compressed write IO
 error
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
Cc: yuchao0@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com, stable@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:yuchao0@huawei.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:stable@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49FE96902A4

aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI2MDYxNjEyNTIxOS4x
Mzk2ODcxLTEtcWl3ZW5qaWVAeGlhb21pLmNvbS9ULyN1CgpPbiBUdWUsIEp1biAxNiwgMjAyNiBh
dCA5OjA04oCvUE0gV2VuamllIFFpIDxxd2podXN0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiAgIEkg
c2VlLiBUaGUgb2xkIHBhdGNoIGFzc3VtZWQgY29tcHJlc3NlZCB3cml0ZWJhY2sgc2hvdWxkIGZv
bGxvdyB0aGUKPiAgIEYyRlNfV0JfQ1BfREFUQSBwYXRoIGJlY2F1c2UgdGhlIGN1cnJlbnQgY29k
ZSBhY2NvdW50cyBpdCB0aGF0IHdheS4KPgo+ICAgQWZ0ZXIgcmVjaGVja2luZyBpdCwgSSBhZ3Jl
ZSB0aGF0IHN0b3BwaW5nIGNoZWNrcG9pbnQgZnJvbSB0aGlzIHBhdGgKPiBpcyBub3QKPiAgIHRo
ZSByaWdodCBmaXguCj4KPiAgIEkgc2VudCBhIHNlcGFyYXRlIHBhdGNoIHRvIGZpeCB0aGUgYWNj
b3VudGluZyBzaWRlIGluc3RlYWQ6Cj4KPiAgIGYyZnM6IGFjY291bnQgY29tcHJlc3NlZCB3cml0
ZWJhY2sgYnkgcmF3IGZvbGlvIHR5cGUKPgo+ICAgSXQgZGVyaXZlcyB0aGUgd3JpdGViYWNrIGNv
dW50IHR5cGUgZnJvbSB0aGUgcmF3IHBhZ2VjYWNoZSBmb2xpbywgc28gbm9ybWFsCj4gICBjb21w
cmVzc2VkIHdyaXRlYmFjayBzdGF5cyBpbiBGMkZTX1dCX0RBVEEsIHdoaWxlIGdjaW5nL0NQLWd1
YXJhbnRlZWQgcmF3Cj4gICBmb2xpb3Mgc3RpbGwgdXNlIEYyRlNfV0JfQ1BfREFUQS4KPgo+Cj4K
Pgo+Cj4gT24gVHVlLCBKdW4gMTYsIDIwMjYgYXQgNDoyNOKAr0FNIEphZWdldWsgS2ltIDxqYWVn
ZXVrQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIDA1LzI1LCBXZW5qaWUgUWkgd3JvdGU6
Cj4gPiA+IENvbXByZXNzZWQgZGF0YSB3cml0ZXMgYXJlIGFjY291bnRlZCBhcyBGMkZTX1dCX0NQ
X0RBVEEgYmVjYXVzZSB0aGV5Cj4gPiA+IHdyaXRlIGNvbXByZXNzZWQgcGFnZXMgdGhyb3VnaCBm
aW8tPmNvbXByZXNzZWRfcGFnZS4gIFRoZWlyIGVuZF9pbyBwYXRoCj4gPiA+IHNob3VsZCB0aGVy
ZWZvcmUgaGF2ZSB0aGUgc2FtZSBjaGVja3BvaW50LXN0b3AgYmVoYXZpb3IgYXMgb3JkaW5hcnkK
PiA+ID4gRjJGU19XQl9DUF9EQVRBIHdyaXRlcy4KPiA+ID4KPiA+ID4gSG93ZXZlciwgZjJmc19j
b21wcmVzc193cml0ZV9lbmRfaW8oKSBvbmx5IHJlY29yZHMgLUVJTyBpbiB0aGUgaW5vZGUKPiA+
ID4gbWFwcGluZyB3aGVuIHRoZSBiaW8gZmFpbHMuICBUaGUgZmlsZXN5c3RlbSBjYW4ga2VlcCBj
aGVja3BvaW50aW5nIGFmdGVyCj4gPiA+IHRoYXQgZmFpbHVyZSwgc28gYSBsYXRlciBjaGVja3Bv
aW50IG1heSBwZXJzaXN0IG1ldGFkYXRhIHRoYXQgcG9pbnRzIHRvCj4gPiA+IGNvbXByZXNzZWQg
ZGF0YSBibG9ja3Mgd2hvc2Ugd3JpdGViYWNrIGZhaWxlZC4KPiA+ID4KPiA+ID4gU3RvcCBjaGVj
a3BvaW50aW5nIHdpdGggU1RPUF9DUF9SRUFTT05fV1JJVEVfRkFJTCBmb3IgZmFpbGVkIGNvbXBy
ZXNzZWQKPiA+ID4gRjJGU19XQl9DUF9EQVRBIHdyaXRlcywgbWF0Y2hpbmcgdGhlIG9yZGluYXJ5
IGRhdGEgd3JpdGUgZW5kX2lvIHBhdGguCj4gPiA+Cj4gPiA+IEZpeGVzOiA0YzhmZjcwOTViZWYg
KCJmMmZzOiBzdXBwb3J0IGRhdGEgY29tcHJlc3Npb24iKQo+ID4gPiBDYzogc3RhYmxlQGtlcm5l
bC5vcmcKPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VuamllIFFpIDxxaXdlbmppZUB4aWFvbWkuY29t
Pgo+ID4gPiAtLS0KPiA+ID4gIGZzL2YyZnMvY29tcHJlc3MuYyB8IDUgKysrKy0KPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4g
PiBpbmRleCBjYWY1MjJkNjY3ZDYuLjliMTUwMTAwNDQ1NiAxMDA2NDQKPiA+ID4gLS0tIGEvZnMv
ZjJmcy9jb21wcmVzcy5jCj4gPiA+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gPiBAQCAt
MTQ4OCw4ICsxNDg4LDExIEBAIHZvaWQgZjJmc19jb21wcmVzc193cml0ZV9lbmRfaW8oc3RydWN0
IGJpbyAqYmlvLCBzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmMmZzX2lzX2NvbXByZXNzZWRfcGFnZShmb2xpbykpOwo+ID4gPiAgICAgICBp
bnQgaTsKPiA+ID4KPiA+ID4gLSAgICAgaWYgKHVubGlrZWx5KGJpby0+Ymlfc3RhdHVzICE9IEJM
S19TVFNfT0spKQo+ID4gPiArICAgICBpZiAodW5saWtlbHkoYmlvLT5iaV9zdGF0dXMgIT0gQkxL
X1NUU19PSykpIHsKPiA+ID4gICAgICAgICAgICAgICBtYXBwaW5nX3NldF9lcnJvcihjaWMtPmlu
b2RlLT5pX21hcHBpbmcsIC1FSU8pOwo+ID4gPiArICAgICAgICAgICAgIGlmICh0eXBlID09IEYy
RlNfV0JfQ1BfREFUQSkKPiA+Cj4gPiBJdCB0dXJucyBvdXQgdGhlIHR5cGUgc2hvdWxkIG5vdCBi
ZSBGMkZTX1dCX0NQX0RBVEEuCj4gPgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgZjJmc19z
dG9wX2NoZWNrcG9pbnQoc2JpLCB0cnVlLCBTVE9QX0NQX1JFQVNPTl9XUklURV9GQUlMKTsKPiA+
ID4gKyAgICAgfQo+ID4gPgo+ID4gPiAgICAgICBmMmZzX2NvbXByZXNzX2ZyZWVfcGFnZShwYWdl
KTsKPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi40My4wCj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IExpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cj4gPiA+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
