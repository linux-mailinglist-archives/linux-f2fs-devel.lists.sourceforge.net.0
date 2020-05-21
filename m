Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8321DC54F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 04:40:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbb7x-0004o1-K3; Thu, 21 May 2020 02:40:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <laoar.shao@gmail.com>) id 1jbb7w-0004nu-Pt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 02:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/RCzazjPJQ1zcfvr5ivU8gZ2oW1vvouNHyaX2fPjs5o=; b=bI9s5ArBU2vz0wnqNOOBAY/LTE
 4Nquaco7OlEO6F8XEaSOboxrmJVyH7VLMNXg6CAZxb6gff4Q+GoHXjuLvyRfnbiaTU5bSDaOWmGBc
 vE8SwfTS1DUd+6I63nU4HUpEdFsyIzkW7H7syW3LanLBfILzS5oHE8+YVycA5A8Rz5r4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/RCzazjPJQ1zcfvr5ivU8gZ2oW1vvouNHyaX2fPjs5o=; b=CdhObMeCVcQF+BIRWDPE0MHmVc
 LsiPGOosSl+cifz0N83l7n8TleLdg6fDj/tChvzXkyav9aZusYjDaDKPCkvbMwW0SBLFxtSJDYsNA
 7aWQOUTxiAhvCBSO0VG7HPqSPfEqa+a0/v5htoRGJOgy8wpBB2AbqnsJ1VdYrUmn+sMA=;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbb7u-00ABx6-W2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 02:40:08 +0000
Received: by mail-il1-f193.google.com with SMTP id l20so5511708ilj.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 May 2020 19:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/RCzazjPJQ1zcfvr5ivU8gZ2oW1vvouNHyaX2fPjs5o=;
 b=JIZNHQnmERaJeRhfnEjjac0W+vknvOwLXY/d6ercTVMilrrz524WChiYGwFGcaHgFJ
 K8JZk1i5INW6EyIXuYOyX2v32bfw6qRfgzQTQHHULRWMhQsYMBm89glhPbVBx2I6bwxs
 j20/Yum6NRQKLWYNIxFRjPx0QViHZTbPlmI1fZzO6exUlTKfLwEVLiDwpVb7Qfp6TgJ/
 snhs+KlBeHyRitCTHyRBIFjZ454fFCb9qrYuro47/SQk4QgBQgus3sRPgPYvG8W/Vui1
 AknW2UXV00QW+opr5rDKKkCPY+BNrd0MlLO7V3cFfkCwusagGNkXGNtRMJgA5pK9QeWA
 IAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/RCzazjPJQ1zcfvr5ivU8gZ2oW1vvouNHyaX2fPjs5o=;
 b=JuofrUwDXsblVtqE17S4rH0sP1kchAWs9bCPYDadTwV61W5pnhL3fF4HfPrD6CfITh
 1J1T2nVIIu43uNUZt3vYWGGdteUYHLnC8ag1Tr3vaP1adlAlzpZ2A7upRwJWtkECw6p6
 kKLDwzhKPF7T9wO3NbanHIe0fxZMg0Xqz0wimKR5sf/LuZp4McrOHYI2qZ26u4br4ss/
 QPvI3jzy3lWz8O6gU3IPCy75yvUrJkgqDtixOvapHcHHhiPc2e8EA5gvu2nToKZTHITU
 N97sDaqvELjlpL7VANrA41ebAJ2b4zKJA6/PDtQ83AREWjziOUVoSzSxR2hfAHxukeRg
 fKjA==
X-Gm-Message-State: AOAM531Ueqglcc2XTarSRYJvvIzdTKed3w2GCZ9yG/xDspCYiwKzjqEU
 OBhmQm7MRg9iGadLwT3VATBOEnAwVtOGRJPKLCE=
X-Google-Smtp-Source: ABdhPJyv/UYZjPy/DPwJRsYbSaKbImcwHJUxF5BT675dGaD56oiGCZioxLSjEnZKhN7916a+tUgfDxQbE7d+nnFanoQ=
X-Received: by 2002:a92:9e11:: with SMTP id q17mr6952459ili.137.1590028801270; 
 Wed, 20 May 2020 19:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
In-Reply-To: <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 21 May 2020 10:39:25 +0800
Message-ID: <CALOAHbDMrHkNHTxeBWP22iTjJd+HfqfFhAfmC_m0jsVkhu5vEA@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (laoar.shao[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jbb7u-00ABx6-W2
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
Cc: lkft-triage@lists.linaro.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Cgroups <cgroups@vger.kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Chris Down <chris@chrisdown.name>,
 open list <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 21, 2020 at 2:00 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> On Wed, 20 May 2020 at 17:26, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> >
> > This issue is specific on 32-bit architectures i386 and arm on linux-next tree.
> > As per the test results history this problem started happening from
> > Bad : next-20200430
> > Good : next-20200429
> >
> > steps to reproduce:
> > dd if=/dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190504A00573
> > of=/dev/null bs=1M count=2048
> > or
> > mkfs -t ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190804A00BE5
> >
> >
> > Problem:
> > [   38.802375] dd invoked oom-killer: gfp_mask=0x100cc0(GFP_USER),
> > order=0, oom_score_adj=0
>
> As a part of investigation on this issue LKFT teammate Anders Roxell
> git bisected the problem and found bad commit(s) which caused this problem.
>
> The following two patches have been reverted on next-20200519 and retested the
> reproducible steps and confirmed the test case mkfs -t ext4 got PASS.
> ( invoked oom-killer is gone now)
>
> Revert "mm, memcg: avoid stale protection values when cgroup is above
> protection"
>     This reverts commit 23a53e1c02006120f89383270d46cbd040a70bc6.
>
> Revert "mm, memcg: decouple e{low,min} state mutations from protection
> checks"
>     This reverts commit 7b88906ab7399b58bb088c28befe50bcce076d82.
>

My guess is that we made the same mistake in commit "mm, memcg:
decouple e{low,min} state mutations from protection
checks" that it read a stale memcg protection in
mem_cgroup_below_low() and mem_cgroup_below_min().

Bellow is a possble fix,

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 7a2c56fc..6591b71 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -391,20 +391,28 @@ static inline unsigned long
mem_cgroup_protection(struct mem_cgroup *root,
 void mem_cgroup_calculate_protection(struct mem_cgroup *root,
                                     struct mem_cgroup *memcg);

-static inline bool mem_cgroup_below_low(struct mem_cgroup *memcg)
+static inline bool mem_cgroup_below_low(struct mem_cgroup *root,
+                                       struct mem_cgroup *memcg)
 {
        if (mem_cgroup_disabled())
                return false;

+       if (root == memcg)
+               return false;
+
        return READ_ONCE(memcg->memory.elow) >=
                page_counter_read(&memcg->memory);
 }

-static inline bool mem_cgroup_below_min(struct mem_cgroup *memcg)
+static inline bool mem_cgroup_below_min(struct mem_cgroup *root,
+                                       struct mem_cgroup *memcg)
 {
        if (mem_cgroup_disabled())
                return false;

+       if (root == memcg)
+               return false;
+
        return READ_ONCE(memcg->memory.emin) >=
                page_counter_read(&memcg->memory);
 }
@@ -896,12 +904,14 @@ static inline void
mem_cgroup_calculate_protection(struct mem_cgroup *root,
 {
 }

-static inline bool mem_cgroup_below_low(struct mem_cgroup *memcg)
+static inline bool mem_cgroup_below_low(struct mem_cgroup *root,
+                                       struct mem_cgroup *memcg)
 {
        return false;
 }

-static inline bool mem_cgroup_below_min(struct mem_cgroup *memcg)
+static inline bool mem_cgroup_below_min(struct mem_cgroup *root,
+                                       struct mem_cgroup *memcg)
 {
        return false;
 }
diff --git a/mm/vmscan.c b/mm/vmscan.c
index c71660e..fdcdd88 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2637,13 +2637,13 @@ static void shrink_node_memcgs(pg_data_t
*pgdat, struct scan_control *sc)

                mem_cgroup_calculate_protection(target_memcg, memcg);

-               if (mem_cgroup_below_min(memcg)) {
+               if (mem_cgroup_below_min(target_memcg, memcg)) {
                        /*
                         * Hard protection.
                         * If there is no reclaimable memory, OOM.
                         */
                        continue;
-               } else if (mem_cgroup_below_low(memcg)) {
+               } else if (mem_cgroup_below_low(target_memcg, memcg)) {
                        /*
                         * Soft protection.
                         * Respect the protection only as long as





> i386 test log shows mkfs -t ext4 pass
> https://lkft.validation.linaro.org/scheduler/job/1443405#L1200
>
> ref:
> https://lore.kernel.org/linux-mm/cover.1588092152.git.chris@chrisdown.name/
> https://lore.kernel.org/linux-mm/CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com/T/#t
>
> --
> Linaro LKFT
> https://lkft.linaro.org



--
Thanks
Yafang


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
