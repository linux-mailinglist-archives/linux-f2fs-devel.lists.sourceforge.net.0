Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CD2760EBC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jul 2023 11:26:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOEJ7-0000dM-Bb;
	Tue, 25 Jul 2023 09:26:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <muchun.song@linux.dev>) id 1qOEJ5-0000dG-W6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 09:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kJwBPug4K2o2Rsg3Nl512ID6Vx26wyYZeksPouOPBIo=; b=UypefnbY8r/wLJGP+rp3sQmQvB
 LrPYm+pm6uIqCwXYRJrWpuvsKvokHqnQDeEVhwiVLhOpvYt6iKQQrXRwqHpFINSNIJkPOpPyb3Srh
 JsNSqh3olmIM1PfmjvO7hxzhYLMpLvV8CkmVkm1dcWzNrqxeOZxDI0UMs0DSXh79exq0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:MIME-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kJwBPug4K2o2Rsg3Nl512ID6Vx26wyYZeksPouOPBIo=; b=Mc80s1DnOyzS1bli7xtY+g916V
 CIH3cUJ3qLzrBpSYM9i8n28lRJa6wr3Zf1S/lTLb0sRisW6MKiSGeLXIkfbMwJ1xzKErEp0m98w9P
 szYEnLI8T+VlpxAe5Yjf7ffTV+pnxsoD7Icw4y9J9EDXGnqlWtxuaVAHvoR0ldDNmQ4M=;
Received: from out-45.mta1.migadu.com ([95.215.58.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOEJ2-001fWB-8e for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jul 2023 09:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690277165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJwBPug4K2o2Rsg3Nl512ID6Vx26wyYZeksPouOPBIo=;
 b=UsXWV/BrmTb/Mzt4qG2L6aakkxaQdFwUIWYXPaL2lks9qA3so8IOOprpfwKsyfOszGQNhK
 441qHddwlHklaskCeo1UAHikFDlDH211gEZQvhiMM0ozG4kf9A5oDb6k5ulzt7O+uqRDww
 PXrlU0RxHN6exb+unDnSMMStapEjRew=
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-10-zhengqi.arch@bytedance.com>
Date: Tue, 25 Jul 2023 17:25:26 +0800
Message-Id: <3D511473-EBD7-4FDF-B85E-AD911A31A260@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-10-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On Jul 24, 2023, at 17:43,
 Qi Zheng <zhengqi.arch@bytedance.com>
 wrote: > > Use new APIs to dynamically allocate the f2fs-shrinker. > >
 Signed-off-by:
 Qi Zheng <zhengqi.arch@bytedance.com> Reviewed-by: Muchun Song
 <songmuchun@bytedance.com>
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qOEJ2-001fWB-8e
Subject: Re: [f2fs-dev] [PATCH v2 09/47] f2fs: dynamically allocate the
 f2fs-shrinker
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
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> Use new APIs to dynamically allocate the f2fs-shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
