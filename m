Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440E248222
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Aug 2020 11:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AA7JuCSbh8chBH7o9Tfb6VW9WbKl68NgAps8CugQ6tQ=; b=hVyBBgzJNYSPJcEEd+c9WCCZYd
	FztGepwW+cfBrra0nAJDcMegz/3dy74o6G8jgD8rrfX7arjrbNUzPGmWjhSB8eibt6qMmDjEwPqlS
	SnexZ1Za8xhn/YRuU4p2fa/i//gtMULfofDnkeMLZRAF8pgAi8vzJnLpyvEAxmqA/uG8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k7yAC-0008Oe-Rf; Tue, 18 Aug 2020 09:44:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tcombes@google.com>) id 1k7yAA-0008OW-Cj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 09:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DCFn5qxq0qR8AW5JPh4s40D0BQZmQsyvgNyso+AYnx4=; b=iFFQkxJUtqAsgW+sL6a94wkmoX
 CJ4KqDdyoekkWkFJtonRzuD8XQUlbGP+dEh3Ro/9HiZeHOg7vuT4rqz8TH30Inb3kvx+hx12oP2B1
 Ko0MRozk6/YQH30tFAjokEjhPXuM/nSXQQDeWIXjxPL01A6LG671teJQUdxPmpXgBVzo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DCFn5qxq0qR8AW5JPh4s40D0BQZmQsyvgNyso+AYnx4=; b=lxI9rrZ90mO+K2b9SAQZY7Sx98
 yvRuM03+Y7STuQQbiSdx6Ne6dmNSNf5APrrn9XiexXRigE7dsQIHdYzyaBK7800krtmaefkIJjzoG
 rbfGjbmDJXTPKPtN17SrykTVkfToM4Ua+G2Z/24MGfUsVQ0j/C3nnwXci9cDFSc+BTq4=;
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7yA8-00BH9s-Pi
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 09:44:14 +0000
Received: by mail-il1-f196.google.com with SMTP id q14so17049784ilj.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Aug 2020 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DCFn5qxq0qR8AW5JPh4s40D0BQZmQsyvgNyso+AYnx4=;
 b=Xu2wcDYpRWRTQr8/YuZ8BEm08Pb1wrvbaikINwMh5JwVgwa0QHb7xNhWVsu0vsWjM2
 C8q0OSFbS397NuO/Jtn7vbe0/LDoz+eKgDoNlViNRjT1pmN66RZboIh5sb5GAGIZzFAs
 8B1bF4EwrfAtRo2uwZ/3eJ3CWH/tUfZTQV/8oNr/ACXXYu5M2XW4cno2AHIIZ4TD9RN/
 ESdJOqs3eSlH8oq9BDHPVmMrsuoOY1IOQBQ8h9LdV4A8nQBwL1+0LaOnqmISsGlKfyo4
 dN2JM2Kv1Q5lY6QvzfuItvA9rvupxH6RdiWD8ZffnwcQ5SaXnHdRzhm3Hyupr/h5xCaz
 Z6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCFn5qxq0qR8AW5JPh4s40D0BQZmQsyvgNyso+AYnx4=;
 b=fWaBC4hsZSmdSydxJkBJ4foz99PzyKL+YJbQLD57yQRg4w45KOHSHJ9wpogw/fyUTg
 rL2Etp1T8zNy45cp09Nn0GM8SKt9T3I4DteEWf4R+QWJXZzeTuGyeR4wZZBPgSqgSwab
 QxON8WmSAFoNgpchDqodcYKfxWclYZ+VFBN50wlj3tRUkXC/usU4fYrZolpnhbPaExJr
 sEnlAVH7ekhfuzj+YSu+Wp1ZM1tsRlM6C+7KDE8mr97U8ipWbtdnPKbXPE8HBIz7RWvY
 Q0ko3DhTahC6pdt2pQ3iNBND4Fggtsi204cu3Fn1kriyp+QTWb96M5qcwy4qpELZau9d
 /GeA==
X-Gm-Message-State: AOAM532SCgR1Res/KYFCsSm7pHjfQBwVCyXzhebMMRkk0ZdJR8vwgkuI
 uhZ0X6DJKk64wBjze6D0uQODcHixz3xB6Sl1BP1s
X-Google-Smtp-Source: ABdhPJy0mta6w36a3TKlKttCClGSKNtLR+7tfLZklXQkerhDDWFIOezvYdg/KjAMIKUTA/T7jiH2jI0mLASYOBxb100=
X-Received: by 2002:a05:6e02:587:: with SMTP id
 c7mr17626722ils.84.1597743846913; 
 Tue, 18 Aug 2020 02:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200813084202.2838098-1-tcombes@google.com>
 <5aa7a3bd-2bfc-f6a5-f08d-2a5b6c12be61@huawei.com>
In-Reply-To: <5aa7a3bd-2bfc-f6a5-f08d-2a5b6c12be61@huawei.com>
Date: Tue, 18 Aug 2020 11:43:55 +0200
Message-ID: <CACGU_wB4kESZ0iqbfbSEO=FLkSRHoJOWESTi1uFHc8hEce9d=w@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.196 listed in wl.mailspike.net]
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
X-Headers-End: 1k7yA8-00BH9s-Pi
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: add -r (fake_seed) and -T flags
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

On Tue, Aug 18, 2020 at 10:26 AM Chao Yu <yuchao0@huawei.com> wrote:
> On 2020/8/13 16:42, Theotime Combes via Linux-f2fs-devel wrote:
> > r flag sets the checkpointing seed to 0 (initially used to
> > remove randomness for apex generation).
> > T flag sets timestamps to a given value.
>
> Normally, we introduce one feature in one patch...it helps review,
> merge or revert patches more easily, how about splitting this into two.
>

Sure, I'll split it into two.

> >
> > Signed-off-by: Theotime Combes <tcombes@google.com>
> > ---
> >   include/f2fs_fs.h       |  3 ++-
> >   man/mkfs.f2fs.8         | 13 +++++++++++++
> >   mkfs/f2fs_format.c      | 26 ++++++++++++++------------
> >   mkfs/f2fs_format_main.c | 10 +++++++++-
> >   4 files changed, 38 insertions(+), 14 deletions(-)
> >
> > diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> > index a9982f0..76db3bf 100644
> > --- a/include/f2fs_fs.h
> > +++ b/include/f2fs_fs.h
> > @@ -405,8 +405,10 @@ struct f2fs_configuration {
> >       int large_nat_bitmap;
> >       int fix_chksum;                 /* fix old cp.chksum position */
> >       __le32 feature;                 /* defined features */
> > +     time_t fixed_time;
> >
> >       /* mkfs parameters */
> > +     int fake_seed;
> >       u_int32_t next_free_nid;
> >       u_int32_t quota_inum;
> >       u_int32_t quota_dnum;
> > @@ -427,7 +429,6 @@ struct f2fs_configuration {
> >       char *mount_point;
> >       char *target_out_dir;
> >       char *fs_config_file;
> > -     time_t fixed_time;
> >   #ifdef HAVE_LIBSELINUX
> >       struct selinux_opt seopt_file[8];
> >       int nr_opt;
> > diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
> > index 022941f..5266dfd 100644
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
> > @@ -74,6 +77,10 @@ mkfs.f2fs \- create an F2FS file system
> >   .I nodiscard/discard
> >   ]
> >   [
> > +.B \-T
> > +.I timestamp
> > +]
> > +[
> >   .B \-w
> >   .I wanted-sector-size
> >   ]
> > @@ -212,6 +219,9 @@ Default is disabled.
> >   Quiet mode.
> >   With it, mkfs.f2fs does not show any messages, including the basic messages.
> >   .TP
> > +.BI \-r
> > +Sets the checkpointing srand seed to 0.
> > +.TP
> >   .BI \-R
> >   Give root_owner option for initial uid/gid assignment.
> >   Default is set by getuid()/getgid(), and assigned by "-R $uid:$gid".
> > @@ -228,6 +238,9 @@ Enable sparse mode.
> >   Specify 1 or 0 to enable or disable discard policy, respectively.
> >   The default value is 1.
> >   .TP
> > +.BI \-T " timestamp"
> > +Set inodes times to a given timestamp.
>
> Can we set this value to -1?
>

-1 is used as an init value, therefore setting this value to -1 will
fall back to using the current time. Should I specify it here ?

> > +.TP
> >   .BI \-w " wanted-sector-size"
> >   Specify the sector size in bytes.
> >   Without it, the sectors will be calculated by device sector size.
> > diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> > index 1639752..e711982 100644
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
> > @@ -1192,11 +1192,11 @@ static int f2fs_write_root_inode(void)
> >       raw_node->i.i_size = cpu_to_le64(1 * blk_size_bytes); /* dentry */
> >       raw_node->i.i_blocks = cpu_to_le64(2);
> >
> > -     raw_node->i.i_atime = cpu_to_le32(time(NULL));
> > +     raw_node->i.i_atime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>
> How about wrapping
>
> (c.fixed_time == -1) ? time(NULL) : c.fixed_time)
>
> to inline function or macro?

I'll replace it with a macro in the new patch (once split),
Thanks for the review!

>
> Thanks,
>
> >       raw_node->i.i_atime_nsec = 0;
> > -     raw_node->i.i_ctime = cpu_to_le32(time(NULL));
> > +     raw_node->i.i_ctime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
> >       raw_node->i.i_ctime_nsec = 0;
> > -     raw_node->i.i_mtime = cpu_to_le32(time(NULL));
> > +     raw_node->i.i_mtime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
> >       raw_node->i.i_mtime_nsec = 0;
> >       raw_node->i.i_generation = 0;
> >       raw_node->i.i_xattr_nid = 0;
> > @@ -1213,7 +1213,8 @@ static int f2fs_write_root_inode(void)
> >               raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
> >
> >       if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME)) {
> > -             raw_node->i.i_crtime = cpu_to_le32(time(NULL));
> > +             raw_node->i.i_crtime = cpu_to_le32(
> > +                     (c.fixed_time == -1) ? time(NULL) : c.fixed_time);
> >               raw_node->i.i_crtime_nsec = 0;
> >       }
> >
> > @@ -1350,11 +1351,11 @@ static int f2fs_write_qf_inode(int qtype)
> >       raw_node->i.i_size = cpu_to_le64(1024 * 6); /* Hard coded */
> >       raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA(qtype));
> >
> > -     raw_node->i.i_atime = cpu_to_le32(time(NULL));
> > +     raw_node->i.i_atime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
> >       raw_node->i.i_atime_nsec = 0;
> > -     raw_node->i.i_ctime = cpu_to_le32(time(NULL));
> > +     raw_node->i.i_ctime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
> >       raw_node->i.i_ctime_nsec = 0;
> > -     raw_node->i.i_mtime = cpu_to_le32(time(NULL));
> > +     raw_node->i.i_mtime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
> >       raw_node->i.i_mtime_nsec = 0;
> >       raw_node->i.i_generation = 0;
> >       raw_node->i.i_xattr_nid = 0;
> > @@ -1545,11 +1546,11 @@ static int f2fs_write_lpf_inode(void)
> >       raw_node->i.i_size = cpu_to_le64(1 * blk_size_bytes);
> >       raw_node->i.i_blocks = cpu_to_le64(2);
> >
> > -     raw_node->i.i_atime = cpu_to_le32(time(NULL));
> > +     raw_node->i.i_atime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
> >       raw_node->i.i_atime_nsec = 0;
> > -     raw_node->i.i_ctime = cpu_to_le32(time(NULL));
> > +     raw_node->i.i_ctime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
> >       raw_node->i.i_ctime_nsec = 0;
> > -     raw_node->i.i_mtime = cpu_to_le32(time(NULL));
> > +     raw_node->i.i_mtime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
> >       raw_node->i.i_mtime_nsec = 0;
> >       raw_node->i.i_generation = 0;
> >       raw_node->i.i_xattr_nid = 0;
> > @@ -1569,7 +1570,8 @@ static int f2fs_write_lpf_inode(void)
> >               raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
> >
> >       if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME)) {
> > -             raw_node->i.i_crtime = cpu_to_le32(time(NULL));
> > +             raw_node->i.i_crtime = cpu_to_le32(
> > +                     (c.fixed_time == -1) ? time(NULL) : c.fixed_time);
> >               raw_node->i.i_crtime_nsec = 0;
> >       }
> >
> > diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> > index 27c1f1d..4acc42a 100644
> > --- a/mkfs/f2fs_format_main.c
> > +++ b/mkfs/f2fs_format_main.c
> > @@ -59,10 +59,12 @@ static void mkfs_usage()
> >       MSG(0, "  -C [encoding[:flag1,...]] Support casefolding with optional flags\n");
> >       MSG(0, "  -p number of pinned segments (2MB) [default:0]\n");
> >       MSG(0, "  -q quiet mode\n");
> > +     MSG(0, "  -r set checkpointing seed (srand()) to 0\n");
> >       MSG(0, "  -R root_owner [default: 0:0]\n");
> >       MSG(0, "  -s # of segments per section [default:1]\n");
> >       MSG(0, "  -S sparse mode\n");
> >       MSG(0, "  -t 0: nodiscard, 1: discard [default:1]\n");
> > +     MSG(0, "  -T timestamps\n");
> >       MSG(0, "  -w wanted sector size\n");
> >       MSG(0, "  -z # of sections per zone [default:1]\n");
> >       MSG(0, "  -V print the version number and exit\n");
> > @@ -124,7 +126,7 @@ static void add_default_options(void)
> >
> >   static void f2fs_parse_options(int argc, char *argv[])
> >   {
> > -     static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:R:s:S:z:t:U:Vfw:";
> > +     static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:rR:s:S:z:t:T:U:Vfw:";
> >       int32_t option=0;
> >       int val;
> >       char *token;
> > @@ -187,6 +189,9 @@ static void f2fs_parse_options(int argc, char *argv[])
> >               case 'p':
> >                       c.pinned_segments = atof(optarg);
> >                       break;
> > +             case 'r':
> > +                     c.fake_seed = 1;
> > +                     break;
> >               case 'R':
> >                       if (parse_root_owner(optarg, &c.root_uid, &c.root_gid))
> >                               mkfs_usage();
> > @@ -205,6 +210,9 @@ static void f2fs_parse_options(int argc, char *argv[])
> >               case 't':
> >                       c.trim = atoi(optarg);
> >                       break;
> > +             case 'T':
> > +                     c.fixed_time = strtoul(optarg, NULL, 0);
> > +                     break;
> >               case 'U':
> >                       c.vol_uuid = strdup(optarg);
> >                       break;
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
