Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8314D1BD88
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 01:46:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjzVYctSfWVHjdABwklEuMKm7O0qvaN72Kb9Nqq07EM=; b=ZsnDmSOyGulRpUcXuWv46fLPsq
	XtHVLORw8B/EmFm6OSTeBxCuUJcD3FvyEGg2DPKCym6tuZuUciZfd+O/FD5mlUg0dnC5IXxg23l33
	Z7fgHcZqV8R7QJj9lYGWa+6mQ/gpDlhjvL/XSTXrj341hwrpQqyijUoERZ6OCdae/I1I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfp1K-0000Dl-9m;
	Wed, 14 Jan 2026 00:45:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <linkinjeon@kernel.org>) id 1vfp1I-0000Da-Gh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 00:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4llGXYRvuSMJm3v6qdRICwJXYadi0GowtdAQN+mKeFI=; b=Zq7sFYYVMzAm2jKq11vebpvnyI
 20jOty9OqzTeqAMKhxrXUspSYRHLiGcLOlWFS/GzDpf4iRDQLr43V+goT0PC58janGRUxEX1h5TrP
 xr0iAxnAMIp78eR8LSQxAINiUmgpbUdJ5kuupVStKyvOIi3hGOmKw+N2mu2o/baU9mus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4llGXYRvuSMJm3v6qdRICwJXYadi0GowtdAQN+mKeFI=; b=RrRmlUthjB9P+sj1pix2JXatkN
 dzqzw1qmRGcfiUdTs4SR6EFqp6t0s46exlb3g4+diUfhEAK8eDLWKvYJ1vadk4wYMsr1dCUrVdg1j
 3y9QPFRykmgOvDHakOL+f4y/Re6/1mYeAhGKMrDLkEtkNtk19Vu2om/YdoOez6OqJUio=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfp1I-0001ry-65 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 00:45:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C671542A66
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jan 2026 00:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4774C19424
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jan 2026 00:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768351550;
 bh=4llGXYRvuSMJm3v6qdRICwJXYadi0GowtdAQN+mKeFI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aegxhiyzNDsTONo0BQ3CWreC650nnrmMEf+kLyPIxzf7XtLyn0B9bkwoHca3n/8m0
 x6oHaRAQbt2WgYJ+KPD2XrxzaG2RQbMIDBWaLXAOqKcFPpVU4vjCNruncTpNXM6ycg
 YxLZ9UTyVBiFbimqvoxzp0rqUCvY6WJ7dm9N/EnyAIZj6lxIKOaLqIciSN/PmbnHkP
 HYMd3CsDq5LcYCa52f0dZd9aaDcnzZgRM9kXwIpjqPpr+UKCFQJ0po6HPSVSiAIFp6
 UzAr3YZr1zSK798EEOWbEchNRSsUGPbzbpWHmMlmkDqYF0oN+ANy0UWhHsTvGAamKt
 +AxiaedWBNaGw==
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b872cf905d3so389896866b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jan 2026 16:45:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXhX8mcRizf6QGWcl+Kb/RQqILwLuFFIE+utqKYzFjcqf75Zy8qnqpAc11n9agpF+gKIC5iBYeq+FwIrwZNIQ+O@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxO+8Nejuga7gaPiSZ5fVZYxoo6UuTF+teFbSqfpsSxw/fE4VQ6
 r2NycKSW0BRb7n74YwwL3ZhvetP3lCiFVBvSl94uZeA539lSPCgQ2Ce0rpgHnwBU/ybcR0okvt3
 QFAq3NJtnExzH4nI0pjv9VeqR+1v600E=
X-Received: by 2002:a17:906:7312:b0:b87:117f:b6f9 with SMTP id
 a640c23a62f3a-b8760fd6d98mr60394266b.8.1768351549250; Tue, 13 Jan 2026
 16:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20260112174629.3729358-1-cel@kernel.org>
 <20260112174629.3729358-4-cel@kernel.org>
In-Reply-To: <20260112174629.3729358-4-cel@kernel.org>
Date: Wed, 14 Jan 2026 09:45:37 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-FM9gLObB6w_sBxuVgW_R7ScA3B8sWEFa3L8jmrRn59Q@mail.gmail.com>
X-Gm-Features: AZwV_QjY05oXsdF3FxB0uAW8CMAbF6w80qw4f0NOwkoEhPhTLUPjoENgYHnABeY
Message-ID: <CAKYAXd-FM9gLObB6w_sBxuVgW_R7ScA3B8sWEFa3L8jmrRn59Q@mail.gmail.com>
To: Chuck Lever <cel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 13, 2026 at 2:46 AM Chuck Lever <cel@kernel.org>
 wrote: > > From: Chuck Lever <chuck.lever@oracle.com> > > Report exFAT's
 case sensitivity behavior via the file_kattr boolean > fields. exF [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfp1I-0001ry-65
Subject: Re: [f2fs-dev] [PATCH v3 03/16] exfat: Implement fileattr_get for
 case sensitivity
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
From: Namjae Jeon via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, linux-cifs@vger.kernel.org, sfrench@samba.org,
 slava@dubeyko.com, linux-ext4@vger.kernel.org, sprasad@microsoft.com,
 frank.li@vivo.com, linux-nfs@vger.kernel.org, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMjo0NuKAr0FNIENodWNrIExldmVyIDxjZWxAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBDaHVjayBMZXZlciA8Y2h1Y2subGV2ZXJAb3JhY2xlLmNv
bT4KPgo+IFJlcG9ydCBleEZBVCdzIGNhc2Ugc2Vuc2l0aXZpdHkgYmVoYXZpb3IgdmlhIHRoZSBm
aWxlX2thdHRyIGJvb2xlYW4KPiBmaWVsZHMuIGV4RkFUIGlzIGFsd2F5cyBjYXNlLWluc2Vuc2l0
aXZlICh1c2luZyBhbiB1cGNhc2UgdGFibGUgZm9yCj4gY29tcGFyaXNvbikgYW5kIGFsd2F5cyBw
cmVzZXJ2ZXMgY2FzZSBhdCByZXN0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2h1Y2sgTGV2ZXIgPGNo
dWNrLmxldmVyQG9yYWNsZS5jb20+CkFja2VkLWJ5OiBOYW1qYWUgSmVvbiA8bGlua2luamVvbkBr
ZXJuZWwub3JnPgpUaGFua3MhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
