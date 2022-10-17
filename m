Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 103856008C2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 10:33:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okLYh-0001f4-K3;
	Mon, 17 Oct 2022 08:33:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dvyukov@google.com>) id 1okLYb-0001ex-1k
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 08:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=azrjkTSUa/x73/5WnmuPzRdP/HPez6bDQxOpksGkhRA=; b=EkLuzRZVeK8dMrIt1Mdu+PvUHc
 0N05srf7+in/Q90sRlCOE4lYAacZcwMlr5qrhmVywLbzZIlTH8//NFpg73EOrzMJ7X3oDX4qhgnMv
 gVnvmDjeqU2pZEdjVp2hPZWvkC5XC2MtaRjSvUTPYpn/B57OeMSYqr5b6F5mdXX3YqjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=azrjkTSUa/x73/5WnmuPzRdP/HPez6bDQxOpksGkhRA=; b=cE6LyJm/Vuv78aBhxEjZFusa79
 J4VMbdmfU7jDl4IVSjud9f/ZzqC6nZmppfMHhtyQmKjhc12KdJKGp5OiinmPZSRCK9LvSGfkhemhD
 ahaqV03vE/gV9UdfG8vU6bskWPCraxkKdi1WKFwut//1hCrFTWMIzO8Hw2zTn574IIXY=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okLYY-00026z-IS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 08:33:08 +0000
Received: by mail-lj1-f174.google.com with SMTP id c20so13060013ljj.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=azrjkTSUa/x73/5WnmuPzRdP/HPez6bDQxOpksGkhRA=;
 b=a/oDAz3xURgSlah+zDO2fzFzfvSFrEjmCsQ5CtmV5wpy8/L51Q77OK5k7mJq+LosYE
 RDJCxvRoEXZS65qMQOnrKu6I9wkhUaPEiyHo/NWSrMkHLiva7vvcuRRaZ3Z2Q44s3sfl
 EvRB3rWoOYqNbHfiOiSOLVn/sZa+2u6b7EbV7urnZXdD3prc0O/Ddpp0UNb8jMFdVh7H
 mNPXpUp5rjHVCeF1JbMiorLWQ+P8IWxh+Ro0RWHT2VHqIjGWHAQ/gveZL6ep25X6ZAnZ
 NBOvAMgMz/qIgTYTo0t2OtD4TIYyFuNUdp8KuqNGvdQuayInWZbNLoBWdlSiwE/zSHUc
 HgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=azrjkTSUa/x73/5WnmuPzRdP/HPez6bDQxOpksGkhRA=;
 b=RJuxXFAe7JFSHpfdfyJl0k04T+nHwTchSAUoEMdqymYxuY5UROLKc7qCI33v09xAnf
 i32YEozFBYTAXnOXDi6HqUXRZn86jDKJrrPYhRs1rLLTXGoiTYHCfjbbyI0T+aKcB7JC
 aEUGXiIIF4WlrxFFsCeFjK0W43/zLTGJpl+xFZe+NFHgb8KRMFtnUmuzkVzJWUkvRePl
 CJDlsRgdyAnCkgBcoHQZCtXUp/tTGdEhETQURlXeYRY30RLrcqjCpsV8QX3oBobCGplR
 YveCWg/Erbip05nl36+b60640LmFOieWOTBXD5Y2ANM8iS9JLkMibmldIT/wavcuy0vJ
 JLNA==
X-Gm-Message-State: ACrzQf3JyricgoJ357uV+YDKcveaj9YEAsQDBsN/MmnqFclhEpiO5WPR
 cbPYRZF7CL/TfIwzEnpJOW+52lvJm3klCga5ehZUgA==
X-Google-Smtp-Source: AMsMyM5v5LDC0BBL5gYqehs/SqfSDyUe3Uxe1Ev3owdj68C4Qz8wqJvfTKXOJXJGGPXuN1JCNY46IEZom7aRnXaTplE=
X-Received: by 2002:a2e:978e:0:b0:26e:8ad6:6d5b with SMTP id
 y14-20020a2e978e000000b0026e8ad66d5bmr3880239lji.363.1665995580212; Mon, 17
 Oct 2022 01:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
 <20221014084837.1787196-6-hrkanabar@gmail.com>
 <Y0mD0LcNvu+QTlQ9@magnolia>
In-Reply-To: <Y0mD0LcNvu+QTlQ9@magnolia>
Date: Mon, 17 Oct 2022 10:32:48 +0200
Message-ID: <CACT4Y+aNuRX52u5j1vKpJKru-riSktugDMtDKchR0NLCuvXOQg@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 14 Oct 2022 at 17:44,
 Darrick J. Wong <djwong@kernel.org>
 wrote: > > On Fri, Oct 14, 2022 at 08:48:35AM +0000, Hrutvik Kanabar wrote:
 > > From: Hrutvik Kanabar <hrutvik@google.com> > > > > Whe [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.174 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.174 listed in wl.mailspike.net]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1okLYY-00026z-IS
Subject: Re: [f2fs-dev] [PATCH RFC 5/7] fs/xfs: support
 `DISABLE_FS_CSUM_VERIFICATION` config option
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
From: Dmitry Vyukov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Cc: Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hrutvik Kanabar <hrutvik@google.com>, kasan-dev@googlegroups.com,
 Hrutvik Kanabar <hrkanabar@gmail.com>, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Marco Elver <elver@google.com>,
 Josef Bacik <josef@toxicpanda.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Anton Altaparmakov <anton@tuxera.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Aleksandr Nogikh <nogikh@google.com>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 14 Oct 2022 at 17:44, Darrick J. Wong <djwong@kernel.org> wrote:
>
> On Fri, Oct 14, 2022 at 08:48:35AM +0000, Hrutvik Kanabar wrote:
> > From: Hrutvik Kanabar <hrutvik@google.com>
> >
> > When `DISABLE_FS_CSUM_VERIFICATION` is enabled, return truthy value for
> > `xfs_verify_cksum`, which is the key function implementing checksum
> > verification for XFS.
> >
> > Signed-off-by: Hrutvik Kanabar <hrutvik@google.com>
>
> NAK, we're not going to break XFS for the sake of automated fuzz tools.

Hi Darrick,

What do you mean by "break"? If this config is not enabled the
behavior is not affected as far as I see.

> You'll have to adapt your fuzzing tools to rewrite the block header
> checksums, like the existing xfs fuzz testing framework does.  See
> the xfs_db 'fuzz -d' command and the relevant fstests.
>
> --D
>
> > ---
> >  fs/xfs/libxfs/xfs_cksum.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/xfs/libxfs/xfs_cksum.h b/fs/xfs/libxfs/xfs_cksum.h
> > index 999a290cfd72..ba55b1afa382 100644
> > --- a/fs/xfs/libxfs/xfs_cksum.h
> > +++ b/fs/xfs/libxfs/xfs_cksum.h
> > @@ -76,7 +76,10 @@ xfs_verify_cksum(char *buffer, size_t length, unsigned long cksum_offset)
> >  {
> >       uint32_t crc = xfs_start_cksum_safe(buffer, length, cksum_offset);
> >
> > -     return *(__le32 *)(buffer + cksum_offset) == xfs_end_cksum(crc);
> > +     if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION))
> > +             return 1;
> > +     else
> > +             return *(__le32 *)(buffer + cksum_offset) == xfs_end_cksum(crc);
> >  }
> >
> >  #endif /* _XFS_CKSUM_H */
> > --
> > 2.38.0.413.g74048e4d9e-goog
> >
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/Y0mD0LcNvu%2BQTlQ9%40magnolia.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
