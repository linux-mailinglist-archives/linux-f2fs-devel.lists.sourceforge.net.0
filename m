Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E346028D810
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Oct 2020 03:40:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kSVlr-00068s-AQ; Wed, 14 Oct 2020 01:40:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kSVlp-000685-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Oct 2020 01:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nST+EHp6dPUeIzQMe4qF0Zs7iUx4bZTLvqvuYC7qQyE=; b=S0T8tuo2iaRNAaD3QkEmQ1oUCy
 bs5bYgo9pUzK7UeGA913oL4vnw+S2qb2fHtJSQLEU5hNQJ0xCY6sc8H/ZMxHFa92EYuik5M+w78zt
 MSy0umQNCxWYjnIc0Ze9/CityMUC+9r2FBuT+3Rmv2xxBphqRu21MyCcs7eDkuZwnbO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nST+EHp6dPUeIzQMe4qF0Zs7iUx4bZTLvqvuYC7qQyE=; b=KrMTJR1Rdi7wSCB/86VGy4B2Re
 QOu7A1bHWpIVWAWZkFXKYI8X8Xuxs30Ae9s8GNEsGp31UxO2bYxYEieS/Xqebs84L/clKqSN9wlSb
 steJCo8UbJSOIweBRwB75SIe5Hs60xWJPwi0PU4nCV2eCNurAG/KB8quklCO4P3/46TQ=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSVlj-009JyE-Dy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Oct 2020 01:40:01 +0000
Received: by mail-lj1-f196.google.com with SMTP id x16so1457674ljh.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Oct 2020 18:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nST+EHp6dPUeIzQMe4qF0Zs7iUx4bZTLvqvuYC7qQyE=;
 b=rCGpZ855CTranpUFcirWGNIsI75YqvWIhNjARsOl9zN9XmEvfT2jT91KULVFecfhNQ
 BJpGVeWZFF+l/zvXEDZV59cO5+WSsnKN4HugS41JNn0DN3C270FNKsK95lOTiHkf8aL1
 vqbGlyHLaCwRtROTbdcQB3Ju8BSfm4e54DOSijnhGiN8tpFBiFxKIQlPPbhlhYwXbkWS
 nAlUn+pJuQKvd09hS9QX0Y/FogU+3mGZOiQS6tAIQYDNh5lFCycllMSj1FrJPJD/zSCk
 j2tVkm5WpunxDupSCJyrmHR5ovW8zbfnPf+VJ3NTAvIdsNfq1XJvt83/d4bf0FMB7RWd
 /JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nST+EHp6dPUeIzQMe4qF0Zs7iUx4bZTLvqvuYC7qQyE=;
 b=QpwfE+p+sNlGMAFmEh3RpnDKgNzBkPpI03Hs8DQh2KA3mIpHWGoB/upDpwzdQ7C6Gi
 Ws4JjymqcWgBKdaR35BMt7gXUOM2YqMgbPe3TcbfZpaIxXu1r3zpWvVJjMdzjFAHSOs9
 eQTVlCOkeJ4c0z/qmTSKmB0qKOmDZhqNeawLGiK9LzpxF5xzRw8iMTXozsvCFnksNxwU
 cEbifGaM9a1FTdbaF0Gtd04yQgAFO99vzpC243vLeBiddhjB3/N2Y85krpM96/sm8UsV
 kEPHox9s4EStwJBQfwN899uqY43O1VgWE6lsjXtE1V26VbeYiErsPmiYQfGFPB3UKCGz
 SJAg==
X-Gm-Message-State: AOAM530i7tz2BXkjeQ6kduzk6NxAo6/jKXdoF4h3NccZ1kc3NpPVNuOH
 0Nzo7BwiUuk0LkG80NvRCb3ul8RzS1eT1ppjN+9E2ixFJP0=
X-Google-Smtp-Source: ABdhPJwaNNbSZxzioyJbjjgd2dSxq6cBGclMu8gyNcLMFIpJxFZFgY03rPUPfLfAtEaGzQTiAzksbCB1CPY7KsuQALU=
X-Received: by 2002:a2e:45d6:: with SMTP id s205mr856725lja.333.1602639581643; 
 Tue, 13 Oct 2020 18:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201013022429.454161-1-daeho43@gmail.com>
 <20201013061349.GD1062@sol.localdomain>
In-Reply-To: <20201013061349.GD1062@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 14 Oct 2020 10:39:30 +0900
Message-ID: <CACOAw_wZ7=cThwsXL+Yd+r26QdXaUoa-QQ6XLDTeqixdMWA=2g@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kSVlj-009JyE-Dy
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add F2FS_IOC_GET_COMPRESS_OPTION
 ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmFuZHksCkknbGwgdGFsayB3aXRoIEYyRlMgbWFpbnRhaW5lcnMgYWJvdXQgdGhpcy4KCkVyaWMs
ClN1cmUsIEknbGwgYWRkIGl0IGluIHRoZSBjb21taXQgbWVzc2FnZS4KCjIwMjDrhYQgMTDsm5Qg
MTPsnbwgKO2ZlCkg7Jik7ZuEIDM6MTMsIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9y
Zz7ri5jsnbQg7J6R7ISxOgo+Cj4gT24gVHVlLCBPY3QgMTMsIDIwMjAgYXQgMTE6MjQ6MjhBTSAr
MDkwMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9u
Z0Bnb29nbGUuY29tPgo+ID4KPiA+IEFkZGVkIGEgbmV3IEYyRlNfSU9DX0dFVF9DT01QUkVTU19P
UFRJT04gaW9jdGwgdG8gZ2V0IGZpbGUgY29tcHJlc3Npb24KPiA+IG9wdGlvbiBvZiBhIGZpbGUu
Cj4gPgo+Cj4gRm9yIG5ldyBpb2N0bHMgcGxlYXNlIG1lbnRpb24gdGhlIGRvY3VtZW50YXRpb24s
IHRlc3RzLCBhbmQgdXNlIGNhc2VzLgo+Cj4gLSBFcmljCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
