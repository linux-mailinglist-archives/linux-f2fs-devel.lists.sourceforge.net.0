Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C359666F62
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 11:18:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFuex-0007T5-IH;
	Thu, 12 Jan 2023 10:18:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pFuev-0007St-Ta
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 10:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WIWPZIKq2KjEJ51tFDiaRs+SDZBMmPeDICQjCFzQKiU=; b=cWIFgkgk5H966YYXXG8Zbt/EkX
 bXZRGFjtwEUf5xK9f5LHLwkOdlrElWWb8AfH+ACwkUcfh2BNQjbHRYY893FxlG10DXfN4CpHRZNnb
 cDujeNQVYLMAZn2fyKvN4MngGnRc+ctI4NIk6ueVcauuMWxQ+IUlLfjnTBbkTskdwjrk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WIWPZIKq2KjEJ51tFDiaRs+SDZBMmPeDICQjCFzQKiU=; b=itFW5C0nxloE4gX3bJrj226U+R
 O+MC8Vc/3y71aDRBELDcqdyqPQ/tjpFLRvwdNdFsc78UDttlpnj73I9X9z6cBJiudg02zcFELwout
 12x6gg1tAcL42lr2l6FK9Pw7dKJYySrGSB36vI1Oi9TiZN61nztsZvFo4jiZE5RjdrQQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFueq-0008DA-4f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 10:18:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B20C061FC6;
 Thu, 12 Jan 2023 10:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB3CC433F0;
 Thu, 12 Jan 2023 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673518678;
 bh=RWmztfAERjHa5tH2ViWsV3yzcmvZGe2nsppJNqvO6nY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QimElLgAUkm2pWG+9clfVm0g/+I6aeQhLiop1NXH3ggqRgiSMYuDCeVoo/S6+gzJY
 PNOdc4zkc3g9vyJRLCGGXs4xGlo2bgd5WV5BpGVnWqWkZWHvG4+Twb3PpOcVWA00TQ
 CtSJ6oBVJZuWds8Gzwxd8uJD8KaK/QeN/ecUiTunWAzFOgwVHZkQpn5DSQxQ5pMdCZ
 nFZuhHlKq/ihDO4Z6VQ2I0D0Z7OO7T2vhPX7bVGqCpBjEdHbFWFj6FAHk6UWQOIMvG
 bwAyAfb1J08LRHSsE2RopFWsuG50ER9ahudfzjFNkB4hLI0aND1X18nTETl1T5hHXf
 F06w0Cy7QBsGA==
Message-ID: <9481a114-04d3-7276-bc82-ee18c685b5a6@kernel.org>
Date: Thu, 12 Jan 2023 18:17:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
References: <20230104211448.4804-1-vishal.moola@gmail.com>
 <20230104211448.4804-15-vishal.moola@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230104211448.4804-15-vishal.moola@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/5 5:14, Vishal Moola (Oracle) wrote: > Converted
 the function to use a folio_batch instead of pagevec. This is in > preparation
 for the removal of find_get_pages_range_tag(). > > Also modifi [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFueq-0008DA-4f
Subject: Re: [f2fs-dev] [PATCH v5 14/23] f2fs: Convert
 f2fs_write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/5 5:14, Vishal Moola (Oracle) wrote:
> Converted the function to use a folio_batch instead of pagevec. This is in
> preparation for the removal of find_get_pages_range_tag().
> 
> Also modified f2fs_all_cluster_page_ready to take in a folio_batch instead
> of pagevec. This does NOT support large folios. The function currently
> only utilizes folios of size 1 so this shouldn't cause any issues right
> now.
> 
> This version of the patch limits the number of pages fetched to
> F2FS_ONSTACK_PAGES. If that ever happens, update the start index here
> since filemap_get_folios_tag() updates the index to be after the last
> found folio, not necessarily the last used page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
