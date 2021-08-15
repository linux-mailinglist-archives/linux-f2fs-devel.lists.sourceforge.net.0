Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF83EC74C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Aug 2021 06:28:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mF7kn-00005o-GU; Sun, 15 Aug 2021 04:28:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mF7kl-00005P-Or
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 Aug 2021 04:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RPDBJvgcmmwVnSdoq4L47G3x6kVI+kyfM8/GYNK4Bcs=; b=W0O1cbxBQUl8COGkhbmDlHGHsy
 EOVy12gRfksfgGKdrxZIjw3w9qGfFr2ylqkCZ1+UJsz+V19DLiNOhCzAsI6BrDZsYgtjObWSQuKK1
 8pkgbwH8xx5U7is6D+F3aVKH6BpVlYEz/g9ap1zp/d8gUowacAcHz+BHPIouTWp4oNVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RPDBJvgcmmwVnSdoq4L47G3x6kVI+kyfM8/GYNK4Bcs=; b=OyIvTVJ8jcdTAtSOepFvirLAbl
 Xdie4M+w+4vnKH6E4ezOHYaYKN02LnK4OyLFcdSc4I+798Wjg9v0/+M30bmR3JY115CIGxw8VMTjE
 VZB0XAQFxEdE9n6cittMc+nfd35hyZLXZ/BPBRT4QiqGaUGUyWLFesFSJlgxG8Pzi3kI=;
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mF7ki-006tjx-LQ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 Aug 2021 04:28:07 +0000
Received: by mail-lf1-f41.google.com with SMTP id i28so1044467lfl.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Aug 2021 21:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RPDBJvgcmmwVnSdoq4L47G3x6kVI+kyfM8/GYNK4Bcs=;
 b=bTM1tNUD1EuPz3dUdONRbIv3RzlDX2ySUFkg/DLP3j84/ro+IU6a6xtTplHuwysE6L
 2/bQfS5AV0mlvMROwboKkyVUN/OrjhjN0KDYQcs4XOsRXjklEraBuSjg13AmwUyZch1B
 33x4eMzLGV86J4vksQbCCanecEHPfgu2uYYc4b5dgs6Q+n67WwOmvGCdujZu/RgLPpGE
 GI9NaPxKL9WsXgLJsE7aiA5J4TtUjM1TnepWzbOORxP4zp5GlGaJGKMAmpnnGb5kGnGW
 ZfpXrjUVYndqQSzKPKNs+AccPFDa4pxeHE/6ZWBqfmqHB0G3lKW667tH6yuajP4P2Kb6
 Wyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RPDBJvgcmmwVnSdoq4L47G3x6kVI+kyfM8/GYNK4Bcs=;
 b=lP5joHQ/WAfNnwm3GngxNrHCiExutpNieeWb8JA74VXcdauWe69idTvsZXdUSQ7RKQ
 3Q8gcLgxToj/sFEw/fPY2Sposp64s2pmzJ3dgii8lwdfZ+jo0Pqxvskbfy1BWOMZGXXc
 giRL4Q4EZveIpbgsiV2u21r1bClx57JBRAVIMT/Dq+NEmDAGmCa6sp3L/gqF20z9zOSq
 IyCQsVQl5QYuqxHFKyPaMl5ZCsOrw9NTEnA4qsmtUuJvHWyRzLC692vDK1GGFQgF1V7/
 J4PAFP2m7SXgjJISFTXMzII7HbDtc9QUPo63fu8WTossW0goGLGOTbJGCLrIJJjDvxKn
 vAKA==
X-Gm-Message-State: AOAM5325r0RG05sh2NgmQX6djd/rmjNNpmkZrm6ucWeycstTbEHl6ZV1
 byNkphNSCGCeCq9zCLF4meJ8k/YUlQm9zb5AfNs=
X-Google-Smtp-Source: ABdhPJz9cJGpVMQ9H0bVorEUzVp8GKhhmDRp+GkNCCPcJGONuWdEl+I3cf6j9flQIkhKF/RUg3N47LX+hEfs4Kxz4zw=
X-Received: by 2002:a05:6512:c08:: with SMTP id
 z8mr7086740lfu.533.1629001678062; 
 Sat, 14 Aug 2021 21:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210803225542.3487172-1-daeho43@gmail.com>
 <2a79c1c5-366b-92d9-4025-dbda660b1178@kernel.org>
 <YRWKKQe0bcgjKIIA@google.com>
 <b1a7b8a6-89dc-9076-2388-ced59aa8c47c@kernel.org>
 <YRbARsMfs2O2fz2s@google.com>
 <b76b5b09-d806-992b-3256-fe7ebfc4a2df@kernel.org>
In-Reply-To: <b76b5b09-d806-992b-3256-fe7ebfc4a2df@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 14 Aug 2021 21:27:47 -0700
Message-ID: <CACOAw_zTAFfQGqRVRADq_dyO-Rf++Sn+uhwJZ+4MHv4rPwozCw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.41 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mF7ki-006tjx-LQ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce periodic iostat io
 latency traces
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Actually, I was working on it, after Chao pointed it out. :)
Merging them into F2FS_IOST and separating it from other files looks better.

On Fri, Aug 13, 2021 at 7:06 PM Chao Yu <chao@kernel.org> wrote:
>
> On 2021/8/14 2:56, Jaegeuk Kim wrote:
> > On 08/13, Chao Yu wrote:
> >> On 2021/8/13 4:52, Jaegeuk Kim wrote:
> >>> On 08/11, Chao Yu wrote:
> >>>> Hi Daeho,
> >>>>
> >>>> On 2021/8/4 6:55, Daeho Jeong wrote:
> >>>>> From: Daeho Jeong <daehojeong@google.com>
> >>>>>
> >>>>> Whenever we notice some sluggish issues on our machines, we are always
> >>>>> curious about how well all types of I/O in the f2fs filesystem are
> >>>>> handled. But, it's hard to get this kind of real data. First of all,
> >>>>> we need to reproduce the issue while turning on the profiling tool like
> >>>>> blktrace, but the issue doesn't happen again easily. Second, with the
> >>>>> intervention of any tools, the overall timing of the issue will be
> >>>>> slightly changed and it sometimes makes us hard to figure it out.
> >>>>>
> >>>>> So, I added F2FS_IOSTAT_IO_LATENCY config option to support printing out
> >>>>> IO latency statistics tracepoint events which are minimal things to
> >>>>> understand filesystem's I/O related behaviors. With "iostat_enable" sysfs
> >>>>> node on, we can get this statistics info in a periodic way and it
> >>>>> would cause the least overhead.
> >>>>>
> >>>>> [samples]
> >>>>>     f2fs_ckpt-254:1-507     [003] ....  2842.439683: f2fs_iostat_latency:
> >>>>> dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
> >>>>> rd_data [136/1/801], rd_node [136/1/1704], rd_meta [4/2/4],
> >>>>> wr_sync_data [164/16/3331], wr_sync_node [152/3/648],
> >>>>> wr_sync_meta [160/2/4243], wr_async_data [24/13/15],
> >>>>> wr_async_node [0/0/0], wr_async_meta [0/0/0]
> >>>>>
> >>>>>     f2fs_ckpt-254:1-507     [002] ....  2845.450514: f2fs_iostat_latency:
> >>>>> dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
> >>>>> rd_data [60/3/456], rd_node [60/3/1258], rd_meta [0/0/1],
> >>>>> wr_sync_data [120/12/2285], wr_sync_node [88/5/428],
> >>>>> wr_sync_meta [52/6/2990], wr_async_data [4/1/3],
> >>>>> wr_async_node [0/0/0], wr_async_meta [0/0/0]
> >>>>>
> >>>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> >>>>>
> >>>>> ---
> >>>>> v2: clean up with wrappers and fix a build breakage reported by
> >>>>>        kernel test robot <lkp@intel.com>
> >>>>> ---
> >>>>>     fs/f2fs/Kconfig             |   9 +++
> >>>>
> >>>> I try to apply this patch in my local dev branch, but it failed due to
> >>>> conflicting with below commit, it needs to rebase this patch to last dev
> >>>> branch.
> >>>
> >>> I applied this in dev branch. Could you please check?
> >>
> >> Yeah, I see.
> >>
> >>>>> +config F2FS_IOSTAT_IO_LATENCY
> >>>>> + bool "F2FS IO statistics IO latency information"
> >>>>> + depends on F2FS_FS
> >>>>> + default n
> >>>>> + help
> >>>>> +   Support printing out periodic IO latency statistics tracepoint
> >>>>> +   events. With this, you have to turn on "iostat_enable" sysfs
> >>>>> +   node to print this out.
> >>>>
> >>>> This functionality looks independent, how about introuducing iostat.h
> >>>> and iostat.c (not sure, maybe trace.[hc])to include newly added structure
> >>>> and functions for dispersive codes cleanup.
> >>
> >> Thoughts? this also can avoid using CONFIG_F2FS_IOSTAT_IO_LATENCY in many places.
> >
> > It seems there's somewhat dependency with iostat which is done by default.
> > How about adding this by default as well in the existing iostat, and then
> > covering all together by F2FS_IOSTAT?
>
> Agreed.
>
> Any thoughts about using separated files to maintain these independent functionality
> codes? like we did in trace.[hc] previously.
>
> Thanks,
>
> >
> >>
> >> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
