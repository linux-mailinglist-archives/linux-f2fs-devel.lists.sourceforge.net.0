Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C81DD322
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 18:35:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jboA2-0002uR-MI; Thu, 21 May 2020 16:35:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jboA0-0002u0-MB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 16:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xPFD7IFPtAwroNkfi9MemR+cpIhDyy+Gat6jBDCzwmc=; b=JVM7krlRBqd2Z39itDOwV7dOqN
 4k/v3I1mbWZM8ynT67cZlV4eDRQKOSiDHd5q6siyGwQx7Q1UhZIfSA7IdTsDy7BjdqjtgZWSVUZd/
 Jh8EsCJfd8O6k4mL7pyIRyV3oRm0vxdP2FOcdBQfkydSZFoQBc0KNjaS2+whr/eyeV0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xPFD7IFPtAwroNkfi9MemR+cpIhDyy+Gat6jBDCzwmc=; b=gOnQcf9+n/wWz1Rxxlmhkgl/YX
 xrfFfdXGi2Qfkqqtuhoh/wU5kA9d9UNHVp2A1nGWswQSQjkHuM5M+VuuBZE2sx87DvKGAc4XTuOUr
 3YUwXat1BDqZ1OXwUTNRiqK2Ep/PAnonnO8cGTk+uMLfDp14StOvCAWQN/piOjMZ0rK8=;
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbo9y-00BMZe-If
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 16:35:08 +0000
Received: by mail-ej1-f65.google.com with SMTP id n24so9609425ejd.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 09:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xPFD7IFPtAwroNkfi9MemR+cpIhDyy+Gat6jBDCzwmc=;
 b=aTbDqZ/Y1Y7w8aXwleY27zh7rIqUgMMjEeTSwCvLV8htD4hAI0Oz99GoC1+1HFUEai
 /YnybHvHa7Q+k63YfNSBkwzaRZmz51GGRqSGZneHylY0FJAZQkWydbgMftQp5FJBpGGA
 X+2cvHHJQou+ARDkJ+XnhvDtYXXWV5j8ynkSrEDVbQfKCyPc/FEj/UMB0q4ifFU11h2/
 G2z+2baNP2Obcm3WKG4zvNpMNamlori4YWa1VH8B+UsrLLgWHWaDkaY55kj5WuChfdOJ
 lsB83+ld0aJ3d3N/fMNMBaVAaeRVnljpDxShKmiCSN3zYZssZrk+CvKudHCFs6VX8hK3
 ZN2w==
X-Gm-Message-State: AOAM532Rh10xo2bOQdxmy7AKcbTvINW3IVhoiFVaDfPwkz6pXZf+djcq
 3QtFJS0MhLzofxXoK5Wz+TA=
X-Google-Smtp-Source: ABdhPJwXVn3GpddymYyJuCnFqK41AXqqaHjxUQiP8VzaDxPtzIQQTqMUciYSPeaIDYFRbF092GX9fQ==
X-Received: by 2002:a17:906:3607:: with SMTP id
 q7mr4218185ejb.81.1590078892997; 
 Thu, 21 May 2020 09:34:52 -0700 (PDT)
Received: from localhost (ip-37-188-180-112.eurotel.cz. [37.188.180.112])
 by smtp.gmail.com with ESMTPSA id m27sm5175644eja.83.2020.05.21.09.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:34:51 -0700 (PDT)
Date: Thu, 21 May 2020 18:34:50 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Chris Down <chris@chrisdown.name>
Message-ID: <20200521163450.GV6462@dhcp22.suse.cz>
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521095515.GK6462@dhcp22.suse.cz>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.65 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbo9y-00BMZe-If
Subject: Re: [f2fs-dev] mm: mkfs.ext4 invoked oom-killer on i386 -
 pagecache_get_page
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
Cc: lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>,
 Yafang Shao <laoar.shao@gmail.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, cgroups@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, open list <linux-kernel@vger.kernel.org>,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 21-05-20 11:55:16, Michal Hocko wrote:
> On Wed 20-05-20 20:09:06, Chris Down wrote:
> > Hi Naresh,
> > 
> > Naresh Kamboju writes:
> > > As a part of investigation on this issue LKFT teammate Anders Roxell
> > > git bisected the problem and found bad commit(s) which caused this problem.
> > > 
> > > The following two patches have been reverted on next-20200519 and retested the
> > > reproducible steps and confirmed the test case mkfs -t ext4 got PASS.
> > > ( invoked oom-killer is gone now)
> > > 
> > > Revert "mm, memcg: avoid stale protection values when cgroup is above
> > > protection"
> > >    This reverts commit 23a53e1c02006120f89383270d46cbd040a70bc6.
> > > 
> > > Revert "mm, memcg: decouple e{low,min} state mutations from protection
> > > checks"
> > >    This reverts commit 7b88906ab7399b58bb088c28befe50bcce076d82.
> > 
> > Thanks Anders and Naresh for tracking this down and reverting.
> > 
> > I'll take a look tomorrow. I don't see anything immediately obviously wrong
> > in either of those commits from a (very) cursory glance, but they should
> > only be taking effect if protections are set.
> 
> Agreed. If memory.{low,min} is not used then the patch should be
> effectively a nop.

I was staring into the code and do not see anything.  Could you give the
following debugging patch a try and see whether it triggers?

diff --git a/mm/vmscan.c b/mm/vmscan.c
index cc555903a332..df2e8df0eb71 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2404,6 +2404,8 @@ static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
 			 * sc->priority further than desirable.
 			 */
 			scan = max(scan, SWAP_CLUSTER_MAX);
+
+			trace_printk("scan:%lu protection:%lu\n", scan, protection);
 		} else {
 			scan = lruvec_size;
 		}
@@ -2648,6 +2650,7 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
 		mem_cgroup_calculate_protection(target_memcg, memcg);
 
 		if (mem_cgroup_below_min(memcg)) {
+			trace_printk("under min:%lu emin:%lu\n", memcg->memory.min, memcg->memory.emin);
 			/*
 			 * Hard protection.
 			 * If there is no reclaimable memory, OOM.
@@ -2660,6 +2663,7 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
 			 * there is an unprotected supply
 			 * of reclaimable memory from other cgroups.
 			 */
+			trace_printk("under low:%lu elow:%lu\n", memcg->memory.low, memcg->memory.elow);
 			if (!sc->memcg_low_reclaim) {
 				sc->memcg_low_skipped = 1;
 				continue;
-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
