Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105433344
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2019 17:16:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hXogn-0001vJ-4Y; Mon, 03 Jun 2019 15:15:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hXogm-0001v5-2i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 15:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YBZvUdvT+YIUX3gm0WGiCiu+uP6hI+3Mjn6Ujup+utc=; b=D1kfxxFhAJYhlTZe6Qhe1ba6J/
 jQFRuJUjSkztKC8nyFFtvsw7wIgSvHG+7nQzl50LnoDhDl8EUpwF9mv9Dbg2U9p//570OGIwPuDFq
 jZyKejac6PCR8Nw/SGdQerTrMEen9fjzrFy2mc/pF7EtMHxzX4UdJARFcTseTpi4SAfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YBZvUdvT+YIUX3gm0WGiCiu+uP6hI+3Mjn6Ujup+utc=; b=dTwhSGp9zdOA7FDw8nJ89LJApk
 sdxru2DKhJ1s7tkWGQD7Eh+odezs/gn7WFyFZo2ciZiej5Gd9MjT7mwIx5fbBE4zPVw+KCoCwCRbc
 lKE9D40tDrsuX2ykNRYBgFEpbMkvdSHkUlThSJsRDMt7MEZPJuc1NhkZq+xgHLu6zClE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hXogk-0045Zr-T8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 03 Jun 2019 15:15:55 +0000
Received: from [192.168.0.101] (unknown [58.212.135.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 296B524CF1;
 Mon,  3 Jun 2019 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559574949;
 bh=54oATYsXXJ8P2M14fItKq+XktmeWUBPg/oIseVIgycE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TpgLbiVsdpdF49lOLEgS3pAq5qsVYM50r0Mf7QmMNRzjzT8t79qh6m4Fskm/t1uYo
 r1bBMKVQe/rmg2KBYIAKSwupUWc1XTvQ+PDNJhfTfzkQpaI1dEC/Plups1LVSK0PPR
 dZ1+o65toz9AvGiaT+4WjOIPD47zO+vVeIiX0Bc4=
To: Daniel Rosenberg <drosen@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190530004906.261170-1-drosen@google.com>
 <20190530004906.261170-5-drosen@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <cbd6e561-66c3-da63-d5b4-e81da990bd15@kernel.org>
Date: Mon, 3 Jun 2019 23:15:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190530004906.261170-5-drosen@google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hXogk-0045Zr-T8
Subject: Re: [f2fs-dev] [PATCH v3 4/4] f2fs: Add option to limit required GC
 for checkpoint=disable
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
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-5-30 8:49, Daniel Rosenberg via Linux-f2fs-devel wrote:
> This extends the checkpoint option to allow checkpoint=disable:%u[%]
> This allows you to specify what how much of the disk you are willing
> to lose access to while mounting with checkpoint=disable. If the amount
> lost would be higher, the mount will return -EAGAIN. This can be given
> as a percent of total space, or in blocks.
> 
> Currently, we need to run garbage collection until the amount of holes
> is smaller than the OVP space. With the new option, f2fs can mark
> space as unusable up front instead of requiring garbage collection until
> the number of holes is small enough.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
