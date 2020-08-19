Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB004249889
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Aug 2020 10:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okcFzEk2dECggFwCr+RD6Ljccm0mlvg3G8GnQYQdByc=; b=l6fbB+gPPerPQU3bB7BJ6VrKsa
	ztSn09iMbBEwLNa9UorgtJNDy6jQKeXXMubEy4OT/4DklTlBFlnbN9RWxNWaymEjbUWLE9gLuwUHg
	euIrrotU/hJHY8vW8sD7VWNoMnNzMLt9lEPA9ptIIFzly3UEfQfnWDyWB2t1h7nTmaZ0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8Jn9-0007Le-02; Wed, 19 Aug 2020 08:49:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tcombes@google.com>) id 1k8Jn8-0007LK-AR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 08:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9DeDJS/ad1ehO8Wu8WSM7n+1Qz11G0vgYrTTdcrOjsc=; b=A16mAY8b4a1qOTWxi5O2pZ5QnE
 N2Kuh/T0rDT4tcMUV/Zqvahk6qgjk4Z2TxuQZKKwCaNWX9s7V3j1TSX6wlMU/FC/Sm9mv3IIDKnd/
 9bc4qWqCEO6x1VLhzfrL8ZJSlCRzmKWscPGQGC7A1v3cfQg40oIGYUleWMB2RgWc21lU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9DeDJS/ad1ehO8Wu8WSM7n+1Qz11G0vgYrTTdcrOjsc=; b=WMatduwDRe3HBm2qB70ZE5m2gQ
 02ZzHU7IZKgdXz4+TxSuEf2VvYoid9gID5HwGXAsnWDdcw8qdAUoRWfsoxWaUm6SBgfqnP7gIHZ4j
 zIzpQ489JS3AkDo184hHZE/dPrWZdhOd1qamwg0v9/m3LhgVCs5cEbVK0fDBdrzv00Bg=;
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k8Jn6-00FvXG-MJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 08:49:54 +0000
Received: by mail-il1-f195.google.com with SMTP id z3so20024532ilh.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Aug 2020 01:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9DeDJS/ad1ehO8Wu8WSM7n+1Qz11G0vgYrTTdcrOjsc=;
 b=MvVrh6g34lWZY+5umIkdnkkCMCabxmRKQKr9mB+CW5JWIaE3J0EFIeVXy39VFCGKKZ
 3G4BTrMrqyLFU0DnZUaXHfncLQobbQrYCSnmbFEE8aDexqG+Dda+ipCbZH5SmAjJ927B
 yYsDF4v6GqBg1t7VHa0heHtf/Zv+usCee1wmmV7q9/KXy4+I7pKt7lngZYKBLi/G4j5d
 XuErDjyzLBfg75czdYNJ3weT6hwb5sqojqvpmvpsl7GSpycjobwBouIPpYPXevlId+s0
 7bQK/UmhkgBTF0wZszHAaxPEzSGnM2vR7vF3Ndsln4QP2guzi43T3WhneKqSSiVdMip4
 opDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9DeDJS/ad1ehO8Wu8WSM7n+1Qz11G0vgYrTTdcrOjsc=;
 b=hHIEi1g0/qbT3+bp/cuWQrkjXhx42P4kqTC7rXBVpqvZlWST8/ZlnaGD6EcBAwJOJT
 Pnefou8OWCZrxm1aciQyp/WgMXOoJdzsX77h57ogJNL6l3xLQEMWKLJYSKUAdl+ZQyz1
 awsBieK7o+zg2iH/NUjTNh1bjsKVGn/fr8NJhPL0lKG+evnJuU0Sjuv5/26udYg6lel9
 aY+EFb/V4OmDLeeOpuy9k9AR935N/Ddon1FFBH3SvAN82HKq4aFV3MV0az0194RR7u9c
 LnyctKZZ11rkTv7moAmohJRw8cFuPwrQcDJeAjHZt0O5ieVWOssXTuiJH1aRyQxqiHWR
 Txdw==
X-Gm-Message-State: AOAM531c2DMLl01EVcK3ZdKgDk7MznqoRcCRTNHObRNx+6DCdUmOMecc
 EPwk5lOlDt5IOxAl6C1LFYIlhFE+RZEIEYwB8+IQX2RZfDkk
X-Google-Smtp-Source: ABdhPJwrR0VyIte/vJSf1VNWOlrnE8znocrZHSVXHU4uSo1nvJQfoDn9qybZouoUXv37aA21VvWKPVPMa0kV3GzHTuQ=
X-Received: by 2002:a92:2550:: with SMTP id l77mr19826867ill.63.1597826986975; 
 Wed, 19 Aug 2020 01:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200818111807.3287440-1-tcombes@google.com>
 <0809cb61-bffe-1722-d156-7fe40ac3bbe3@huawei.com>
In-Reply-To: <0809cb61-bffe-1722-d156-7fe40ac3bbe3@huawei.com>
Date: Wed, 19 Aug 2020 10:49:36 +0200
Message-ID: <CACGU_wCt01qio6uKX1QbjeCT3WGCqUoh_1R4ih7K2b+hJ7Ud=g@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1k8Jn6-00FvXG-MJ
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: add -r (fake_seed) flag
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
From: Theotime Combes via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Theotime Combes <tcombes@google.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 19, 2020 at 3:44 AM Chao Yu <yuchao0@huawei.com> wrote:
>
> Hi Theotime,
>
> The implementation looks clean to me, but could you please describe more
> about what the problem will be caused by randomness for apex generation?
>

Hi Chao,
We are adding F2FS support for apex_payload.img (read-only filesystem;
https://source.android.com/devices/tech/ota/apex).
It is necessary for the APEX workflow to have a deterministic output
at generation time (i.e: given the same set of input files, we need to
have the exact same payload regardless of the time of creation).
Fixing the seed is part of solving this problem!
I hope that it makes sense.

> On 2020/8/18 19:18, Theotime Combes via Linux-f2fs-devel wrote:
> > r flag sets the checkpointing seed to 0 (initially used to
> > remove randomness for apex generation)
> >
> > Signed-off-by: Theotime Combes <tcombes@google.com>
> > ---
> >   include/f2fs_fs.h       | 1 +
> >   man/mkfs.f2fs.8         | 6 ++++++
> >   mkfs/f2fs_format.c      | 2 +-
> >   mkfs/f2fs_format_main.c | 6 +++++-
> >   4 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> > index a9982f0..e6f996b 100644
> > --- a/include/f2fs_fs.h
> > +++ b/include/f2fs_fs.h
> > @@ -407,6 +407,7 @@ struct f2fs_configuration {
> >       __le32 feature;                 /* defined features */
> >
> >       /* mkfs parameters */
> > +     int fake_seed;
> >       u_int32_t next_free_nid;
> >       u_int32_t quota_inum;
> >       u_int32_t quota_dnum;
> > diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
> > index 022941f..d517165 100644
> > --- a/man/mkfs.f2fs.8
> > +++ b/man/mkfs.f2fs.8
> > @@ -59,6 +59,9 @@ mkfs.f2fs \- create an F2FS file system
> >   .B \-q
> >   ]
> >   [
> > +.B \-r
> > +]
> > +[
> >   .B \-R
> >   .I root_owner
> >   ]
> > @@ -212,6 +215,9 @@ Default is disabled.
> >   Quiet mode.
> >   With it, mkfs.f2fs does not show any messages, including the basic messages.
> >   .TP
> > +.BI \-r
> > +Sets the checkpointing srand seed to 0.
> > +.TP
> >   .BI \-R
> >   Give root_owner option for initial uid/gid assignment.
> >   Default is set by getuid()/getgid(), and assigned by "-R $uid:$gid".
> > diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> > index 1639752..d31cca4 100644
> > --- a/mkfs/f2fs_format.c
> > +++ b/mkfs/f2fs_format.c
> > @@ -692,7 +692,7 @@ static int f2fs_write_check_point_pack(void)
> >       }
> >
> >       /* 1. cp page 1 of checkpoint pack 1 */
> > -     srand(time(NULL));
> > +     srand((c.fake_seed) ? 0 : time(NULL));
> >       cp->checkpoint_ver = cpu_to_le64(rand() | 0x1);
> >       set_cp(cur_node_segno[0], c.cur_seg[CURSEG_HOT_NODE]);
> >       set_cp(cur_node_segno[1], c.cur_seg[CURSEG_WARM_NODE]);
> > diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> > index 27c1f1d..ac9d8c8 100644
> > --- a/mkfs/f2fs_format_main.c
> > +++ b/mkfs/f2fs_format_main.c
> > @@ -59,6 +59,7 @@ static void mkfs_usage()
> >       MSG(0, "  -C [encoding[:flag1,...]] Support casefolding with optional flags\n");
> >       MSG(0, "  -p number of pinned segments (2MB) [default:0]\n");
> >       MSG(0, "  -q quiet mode\n");
> > +     MSG(0, "  -r set checkpointing seed (srand()) to 0\n");
> >       MSG(0, "  -R root_owner [default: 0:0]\n");
> >       MSG(0, "  -s # of segments per section [default:1]\n");
> >       MSG(0, "  -S sparse mode\n");
> > @@ -124,7 +125,7 @@ static void add_default_options(void)
> >
> >   static void f2fs_parse_options(int argc, char *argv[])
> >   {
> > -     static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:R:s:S:z:t:U:Vfw:";
> > +     static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:rR:s:S:z:t:U:Vfw:";
> >       int32_t option=0;
> >       int val;
> >       char *token;
> > @@ -187,6 +188,9 @@ static void f2fs_parse_options(int argc, char *argv[])
> >               case 'p':
> >                       c.pinned_segments = atof(optarg);
> >                       break;
> > +             case 'r':
> > +                     c.fake_seed = 1;
> > +                     break;
> >               case 'R':
> >                       if (parse_root_owner(optarg, &c.root_uid, &c.root_gid))
> >                               mkfs_usage();
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
