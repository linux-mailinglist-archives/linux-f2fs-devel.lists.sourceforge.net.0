Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA21F762B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2020 11:43:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjgE2-00005k-OR; Fri, 12 Jun 2020 09:43:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jjgE1-00005d-EW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jun 2020 09:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aIjum0OdXj+v8gBuVrC8N67GclMwnVqsebwDSnxt9vM=; b=gQZhuYr+9hCSa4GzaLKrauKIb6
 wMXYfnmQeUWvje4klcKOGE0WygtxWOZ1gjPoIN5VikXWXbAlm9QTqz5GXGNnO/NwIGLogzNyYJwGG
 ++sL8bgOZgzsW9a7dIj7Qi47+8AG7XN0MAn9IrdvDeLo8j+e/2Q08+XjUxOtGNrA0DG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aIjum0OdXj+v8gBuVrC8N67GclMwnVqsebwDSnxt9vM=; b=OcVJyMSsRkSMNe8DzY5tnZV/2u
 9KyZ1IP3F4ShBoOCkiV6fWtxM+rU0wuzpNOQpdjq694SjI73EHfmDDA6pMv3H/fhEooKsftTVOW3m
 VR7f4miuKN03bTwVSXAQ9kZAfGNSKnwI1ZBXQDkC541hFUINSKw/0OVcM5U4Tqirm9tw=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jjgDs-00HazE-UJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jun 2020 09:43:49 +0000
Received: by mail-lj1-f193.google.com with SMTP id i3so5798569ljg.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jun 2020 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aIjum0OdXj+v8gBuVrC8N67GclMwnVqsebwDSnxt9vM=;
 b=B5zzUnrxMZIR1cvpNNJdn3LFoosy6pPU4isLVSWgJ9nP8PUuaqb/X7mACFUtN4Zz0e
 je1pJ6/7L30IUd9miR1oO0pReCGX2bidQmzsxFyBH7tKSWWLqW6VQz10wJTlfMKj9rrB
 WBE/JK4Uw5jGqY0GBMDdgRP4v094YfQNIFITKncq2chQL2ULqFL5HZsbtycVUANMKQ4q
 Ff22Q8bj6f9otWxYKNEcAsUS4YOjCGydg0FG7aELVJHksT7x7qdY2jHFHD/khmaddwqh
 5gNJVS3WCEasOzyYFedHV6DyZL/RyohzMUHwWpOSbVYfzQc6KihVidQjyi/EVoZE4LYe
 XpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aIjum0OdXj+v8gBuVrC8N67GclMwnVqsebwDSnxt9vM=;
 b=Qlk9d+2qSegHUt9azuIk8F+2S/08LZXhQEXekZ11SwwP4gfCLLoepxQ9R0lJlDZgcG
 8tx8EviFm+3FZlkdBVCaxd5OXqB2RDpN/ZOHTwecw17UnZAmyIyeABcJhm96U+/ykYvU
 iuWRU55PS2c+xQcSIehBq4CXtzVunFmef5SRBZv47lVy9WCrs99uoSAz2OUpTJ9minX6
 OEoTZwmYpZcJzGPMXTPtYZtKviykTm68GgVOQX6RDxO50X42oYKh4t66siq8eiXQ7+0q
 ROroyzshGooKD+lzkT/b3u/YOS43LrU6HNFFGORvsnno9Vu/hYbLAVxdYwLbV3hXMBZw
 jWww==
X-Gm-Message-State: AOAM533yiVos8OSxTIeA+nNNQ/8sBpzWe2KU+scOyQ0Uh8NfOCWrgvAD
 eTUQsozeirKXpgEtCMs05ZQrRGrilzqUBgKxm7fwWkqERXxIWw==
X-Google-Smtp-Source: ABdhPJw5tmdt3Qb2oH83ueGFSlyEX7PXjd2r9+J99+ZU7hJQo8IwOlnJ7848er/3tfXq8Sq1AS7XMX8/8Aq5t7u2d+4=
X-Received: by 2002:a2e:984b:: with SMTP id e11mr6079071ljj.358.1591955014129; 
 Fri, 12 Jun 2020 02:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com>
 <CA+G9fYs2jg-j_5fdb0OW0G-JzDjN7b8d9qnX7uuk9p4c7mVSig@mail.gmail.com>
 <20200528150310.GG27484@dhcp22.suse.cz>
 <CA+G9fYvDXiZ9E9EfU6h0gsJ+xaXY77mRu9Jg+J7C=X4gJ3qvLg@mail.gmail.com>
 <20200528164121.GA839178@chrisdown.name>
 <CALOAHbAHGOsAUUM7qn=9L1u8kAf6Gztqt=SyHSmZ9XuYZWcKmg@mail.gmail.com>
 <20200529015644.GA84588@chrisdown.name> <20200529094910.GH4406@dhcp22.suse.cz>
 <20200611095514.GD20450@dhcp22.suse.cz>
In-Reply-To: <20200611095514.GD20450@dhcp22.suse.cz>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 12 Jun 2020 15:13:22 +0530
Message-ID: <CA+G9fYsjH8vOTkSKGa5vgC=0fEXuC5UnGsZOirHxH9nOJSHPdA@mail.gmail.com>
To: Michal Hocko <mhocko@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jjgDs-00HazE-UJ
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

On Thu, 11 Jun 2020 at 15:25, Michal Hocko <mhocko@kernel.org> wrote:
>
> On Fri 29-05-20 11:49:20, Michal Hocko wrote:
> > On Fri 29-05-20 02:56:44, Chris Down wrote:
> > > Yafang Shao writes:
> > Agreed. Even if e{low,min} might still have some rough edges I am
> > completely puzzled how we could end up oom if none of the protection
> > path triggers which the additional debugging should confirm. Maybe my
> > debugging patch is incomplete or used incorrectly (maybe it would be
> > esier to use printk rather than trace_printk?).
>
> It would be really great if we could move forward. While the fix (which
> has been dropped from mmotm) is not super urgent I would really like to
> understand how it could hit the observed behavior. Can we double check
> that the debugging patch really doesn't trigger (e.g.
> s@trace_printk@printk in the first step)?

Please suggest to me the way to get more debug information
by providing kernel debug patches and extra kernel configs.

I have applied your debug patch and tested on top on linux next 20200612
but did not find any printk output while running mkfs -t ext4 /drive test case.


> I have checked it again but
> do not see any potential code path which would be affected by the patch
> yet not trigger any output. But another pair of eyes would be really
> great.


---
diff --git a/mm/vmscan.c b/mm/vmscan.c
index b6d84326bdf2..d13ce7b02de4 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2375,6 +2375,8 @@ static void get_scan_count(struct lruvec
*lruvec, struct scan_control *sc,
  * sc->priority further than desirable.
  */
  scan = max(scan, SWAP_CLUSTER_MAX);
+
+ trace_printk("scan:%lu protection:%lu\n", scan, protection);
  } else {
  scan = lruvec_size;
  }
@@ -2618,6 +2620,7 @@ static void shrink_node_memcgs(pg_data_t *pgdat,
struct scan_control *sc)

  switch (mem_cgroup_protected(target_memcg, memcg)) {
  case MEMCG_PROT_MIN:
+ trace_printk("under min:%lu emin:%lu\n", memcg->memory.min,
memcg->memory.emin);
  /*
  * Hard protection.
  * If there is no reclaimable memory, OOM.
@@ -2630,6 +2633,7 @@ static void shrink_node_memcgs(pg_data_t *pgdat,
struct scan_control *sc)
  * there is an unprotected supply
  * of reclaimable memory from other cgroups.
  */
+ trace_printk("under low:%lu elow:%lu\n", memcg->memory.low,
memcg->memory.elow);
  if (!sc->memcg_low_reclaim) {
  sc->memcg_low_skipped = 1;
  continue;
-- 
2.23.0

ref:
test output:
https://lkft.validation.linaro.org/scheduler/job/1489767#L1388

Test artifacts link (kernel / modules):
https://builds.tuxbuild.com/5rRNgQqF_wHsSRptdj4A1A/
- Naresh


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
