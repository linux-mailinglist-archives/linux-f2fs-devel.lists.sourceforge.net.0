Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51E762C90
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 09:06:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOYb9-0007JV-8q;
	Wed, 26 Jul 2023 07:06:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <muchun.song@linux.dev>) id 1qOYb7-0007JP-MN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 07:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qP6Rsnsz9/WW+azSq2vXZZSPSLEyAJb/Z8peE40gYgo=; b=TIBf6xYsgp7jStZR+GEL7W4wf1
 aObXyjsnhgibhhHOstWYtLNKamKyCEbo7ep9Imzcda4RUEwdMdS4i5s/pwmjK30HKRoVcYJzJdchm
 YoFh38FLy46D0QXCOT4u1FgHX9uXQb11k5UMFiW0dyucbDlVnUbM7MmIpe4l8OwPo+5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:MIME-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qP6Rsnsz9/WW+azSq2vXZZSPSLEyAJb/Z8peE40gYgo=; b=eIB208vi76XK3ymVJn7snzLX+l
 2Kk6uFxxJZz4G1uUIQXDnpIBTLU4D6cm8H1jn8cr6hqUb18lpV4Iysx9i2BPh9e+dfDUiaLqFYggO
 rEHG2ZVqNyIkAm2dUV/Dcbx2xSKFH5IXXryrg8QcUOsrW6mImfPNf/MXsMgWus8ptzy4=;
Received: from out-1.mta1.migadu.com ([95.215.58.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOYb6-0007TJ-EK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 07:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690355165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qP6Rsnsz9/WW+azSq2vXZZSPSLEyAJb/Z8peE40gYgo=;
 b=vw9dtxapJigzblTo3NGynfsv+/mQB1bNWjl6Q4rEAUF9PXc7LtA8X1zBeOoHG+17byUEV5
 rePGXHXPmPLeGOzGrE1/eqTwEdZgvDm17pzQtihT75dgxUeL35Q3sxqIVQekgyvV9/7bXJ
 pXhSlPCuY6BK9bze6xRNH/dP9jDuXVc=
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-19-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:05:26 +0800
Message-Id: <07191509-5186-487B-96D5-F859498CB93E@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-19-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On Jul 24, 2023, at 17:43,
 Qi Zheng <zhengqi.arch@bytedance.com>
 wrote: > > Use new APIs to dynamically allocate the rcu-kfree shrinker. >
 > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> > -- [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qOYb6-0007TJ-EK
Subject: Re: [f2fs-dev] [PATCH v2 18/47] rcu: dynamically allocate the
 rcu-kfree shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 yujie.liu@intel.com, Vlastimil Babka <vbabka@suse.cz>,
 linux-raid@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> Use new APIs to dynamically allocate the rcu-kfree shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
> kernel/rcu/tree.c | 21 +++++++++++++--------
> 1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 1449cb69a0e0..d068ce3567fc 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -3445,12 +3445,7 @@ kfree_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> return freed == 0 ? SHRINK_STOP : freed;
> }
> 
> -static struct shrinker kfree_rcu_shrinker = {
> -	.count_objects = kfree_rcu_shrink_count,
> -	.scan_objects = kfree_rcu_shrink_scan,
> -	.batch = 0,
> -	.seeks = DEFAULT_SEEKS,
> -};
> +static struct shrinker *kfree_rcu_shrinker;

Same as patch #17.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
