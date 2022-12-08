Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2A864776F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Dec 2022 21:43:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3Njl-00023l-8Y;
	Thu, 08 Dec 2022 20:43:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca.boccassi@gmail.com>) id 1p3Njj-00023Z-Ts
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 20:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E980lveCUquKKhcMXhM1jQtjJxf2DwElGgp3q5gC3Vs=; b=KzRYtgDgdEt3PYfF1p++PF0Ngi
 BcNYjCIkBGzzaWtrnILCo8/lW+53pMYR/D24yCBsBfAlRQkT52xWG2tvo+OdkaoZLwKuno1zwcaHE
 bklyOBca/Zwj33U4UQy+Kbbtm/H91OWYceXpPnQMDFklfVbdBwYQMX9NgmaX49SQrzcQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E980lveCUquKKhcMXhM1jQtjJxf2DwElGgp3q5gC3Vs=; b=VnEILYefFLJCFVC6Ggw4V9Xv56
 FcAKgGHevvxvm8aNdtUDYMToSbCDm3E70pOEvPJOl38he0rF0zKeLYgSSwlniF1szeg4KE5LFekfk
 6sg2GvfWytwrAKzrF5rI2Aqi+0EgzDPgIcox8mYv1AV2pBC9g3rv52GrByKAXdjzCjDc=;
Received: from mail-qt1-f181.google.com ([209.85.160.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p3Njf-0007nD-Li for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 20:43:19 +0000
Received: by mail-qt1-f181.google.com with SMTP id fu10so2108241qtb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Dec 2022 12:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E980lveCUquKKhcMXhM1jQtjJxf2DwElGgp3q5gC3Vs=;
 b=QL5XxRZ5oMeiqu/JCa6anNEua7upwc8dI2AfPXQMpHRsyivU0Ao8eBEP2xhq+XzIOA
 d1STIv+1FfGiMPMCD9Nhb3D9/L0wgrO8jAJlE3T1b6e9TW3+aXQ0U3GeqPXjt2xt0oTb
 gfn/oNWSv2urUnQ76UC/8ZmhqidoKtyZkOYQYBTf05zVcKCToup0xw5MVlyXuwvbN7S8
 Kf6+y+hZIo40EPcNByz79SyoGf0OHNdCkR0PQwyX93H2uNrGnOc0w77tbsq7NFsAXJK2
 HQlHjQYyQ1EdCaUOlMvqc51v47gvEYC6rQK9Ltiqj2hYWljo++9cr9hm5D331u5UfKIz
 7hUQ==
X-Gm-Message-State: ANoB5plJsNgtNF49QFEWqZmrWPYMp+Es2omT3omaHrqY2Cidi2fX4U80
 qX7CvvWdm4nfaSkNeJY736C8JbmjBVkPEQ==
X-Google-Smtp-Source: AA0mqf41qHNy4+a0NHXSYqg+QvCmjjWVSNU1fsHA5c/zqs/HgbkHbpCrd1KyZDCTdlFIaLBZltm/bA==
X-Received: by 2002:a05:622a:509e:b0:3a6:8b3a:6450 with SMTP id
 fp30-20020a05622a509e00b003a68b3a6450mr4644496qtb.54.1670532188509; 
 Thu, 08 Dec 2022 12:43:08 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 x12-20020ac8538c000000b003a7e38055c9sm8191863qtp.63.2022.12.08.12.43.08
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 12:43:08 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-3704852322fso27934727b3.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Dec 2022 12:43:08 -0800 (PST)
X-Received: by 2002:a81:ff06:0:b0:3ab:6ff4:a598 with SMTP id
 k6-20020a81ff06000000b003ab6ff4a598mr5143379ywn.425.1670532187832; Thu, 08
 Dec 2022 12:43:07 -0800 (PST)
MIME-Version: 1.0
References: <20221208033523.122642-1-ebiggers@kernel.org>
In-Reply-To: <20221208033523.122642-1-ebiggers@kernel.org>
From: Luca Boccassi <bluca@debian.org>
Date: Thu, 8 Dec 2022 20:42:56 +0000
X-Gmail-Original-Message-ID: <CAMw=ZnQUmeOWQkMM9Kn5iYaT4dyDQ3j1K=dUgk9jFNcHPxxHrg@mail.gmail.com>
Message-ID: <CAMw=ZnQUmeOWQkMM9Kn5iYaT4dyDQ3j1K=dUgk9jFNcHPxxHrg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 8 Dec 2022 at 03:35,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > From: Eric Biggers <ebiggers@google.com> > > An issue that arises
 when migrating from builtin signatures to userspace > signa [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [luca.boccassi[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1p3Njf-0007nD-Li
Subject: Re: [f2fs-dev] [PATCH] fsverity: don't check builtin signatures
 when require_signatures=0
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 8 Dec 2022 at 03:35, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> An issue that arises when migrating from builtin signatures to userspace
> signatures is that existing files that have builtin signatures cannot be
> opened unless either CONFIG_FS_VERITY_BUILTIN_SIGNATURES is disabled or
> the signing certificate is left in the .fs-verity keyring.
>
> Since builtin signatures provide no security benefit when
> fs.verity.require_signatures=0 anyway, let's just skip the signature
> verification in this case.
>
> Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
> Cc: <stable@vger.kernel.org> # v5.4+
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/signature.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Acked-by: Luca Boccassi <bluca@debian.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
