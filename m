Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4645ECE8D37
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 07:51:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwt7XF5WDclFEqhUB41MUUOpJAcTQFwg+jdH2+B4IVg=; b=kekG+cPs/NNHqY3n5vpVClIXZq
	6laUAUFQIt8el2u22kFyHBHNJrqnYXgS367fFBL5ZdgQqKcYjTfCBWhrxZAarYsw8J/j9wWv05xHo
	U7IuFUT0R0HyTn4Y0UCr5nV9KYl1UG7MtAtvEXC436Oee0B0ahweytQ0EpPyuk/Reiss=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaTa3-0002WK-75;
	Tue, 30 Dec 2025 06:51:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vaTa1-0002W5-Pl
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 06:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h5ER2xtR40XTSKe1lB254muH3HlJ4PUVzIRPuMrPjM0=; b=crPWbw0ugp9xIRm+jbXPG/Da0G
 xNLM2YQwzn0+oglh0OuklilaHd64M/Dhu+vqnz08GAtnWwVkHw26BKi9/GbN33AD89oJEbRWgKDh/
 CJU0M2aH4Vjsp/JnG6bG8i6toMIsn7DgUm4Tz16RTnrPQhB4/e1d4MCf/PEWINwjGoj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h5ER2xtR40XTSKe1lB254muH3HlJ4PUVzIRPuMrPjM0=; b=YNTmqxdgJ3oBmKPDLrGaLEPxS9
 4bwFtTUcb+9AlVv+0Jz0Epg7t2JI3CjtlX+MgkBqy8PVQTqVLvl+IUzTHTOGNA2tgnyjFrQ2UU7yY
 7lxIh3sBuIHu0D+6yZLH9z5FWP2wmptot/3TlmQk5nuF1P0tf/RfIobw0FQtQ66IRuQw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vaTa2-0000FJ-5p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 06:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A17C16000A;
 Tue, 30 Dec 2025 06:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A7FC4CEFB;
 Tue, 30 Dec 2025 06:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767077491;
 bh=QCFQ70Fr5frJi8Omz/8ACHo5fyRCwV9ykUEghqZZn6E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=IX25NgdBs6e21ke2RzK0DVna2pwcQgm1zqtNtTBdpaU9P5dDV5HugMdpPs6Vb3LJH
 khNS/EuinqYMTHPeSEzlhtkYsMyyjMSMoroAH0fsmXVesKHJnAkTOfbwWNPY5uk0Yh
 A4JNB4BXr2ScMeoMy7pvHnA8QLchTed5ku/RiDli3sTxHsui6A98kaiaxtONqie6y4
 u3+eFKmMbfzzZhsDLow+6uDRIydGbfVfdpNQ5Lrpk1M+7AAmiqu0LY54fqOEsndLYU
 vcX3NPSe97MYoZewt5Vduem7d1onBmSo9zWg+txW4U9ZnzOQ19yNbHhJC1M3hUIaZi
 AbL5d8svtnh3A==
Message-ID: <b8147124-113f-49e0-bb1a-7edb29d28837@kernel.org>
Date: Tue, 30 Dec 2025 14:51:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251227091906.216322-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251227091906.216322-2-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27/2025 5:19 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > The force parameter in
 __submit_merged_write_cond
 is redundant, where > `force == true` implies `inode = [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vaTa2-0000FJ-5p
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: clean up the force parameter in
 __submit_merged_write_cond()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/27/2025 5:19 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> The force parameter in __submit_merged_write_cond is redundant, where
> `force == true` implies `inode == NULL && folio == NULL && ino == 0` is
> true, and `force == false` implies `inode != NULL || folio != NULL ||
> ino != 0` is true. Thus, this patch replaces the force parameter with
> a stack variable force.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
