Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A0282A64C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 04:06:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNlOE-0006DC-Bh;
	Thu, 11 Jan 2024 03:05:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rNlOC-0006D1-QD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 03:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p8zGpnOhjIsJWTG2MP0QX1nzu+G45rqkX5txUzJsb6U=; b=O+QSyYyR1HdQDI9TtsSvZd0Y8h
 NBgjuctS4Jw0GTDqXO52g8AwqdQzjMZ5XYMuMd8WsFO8AxMhH8uNQAPGyuoA22v5H9Sq+hA/qS+oL
 hKegt2VzjKuuxl+y1tQdebMqj3u+BwUAZ0AFBTBN/sO7k3JKdfZCxw0HlLM8bhiy2LP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p8zGpnOhjIsJWTG2MP0QX1nzu+G45rqkX5txUzJsb6U=; b=Vx4ECuclZYOAmstL6lKNOcsmDe
 e/3NSqsfng6Dtmx6iljGdIKeM4N4hITOBIgc7EfIJHmTn29Eoa2gUcxuOe1Pi0sfPqGXsXmIqwXd2
 dYIHyc87Cz61G2zf84dWlrGbKxEGC5udDfq+eNniunJh57qUWWVOyuvaHdf1SH6bqQTg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNlO9-0006Qd-5x for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 03:05:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 50F0BCE1E4E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jan 2024 03:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE71C433C7;
 Thu, 11 Jan 2024 03:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704942328;
 bh=ZLl7kGhUGnW8PU9f96aUKCXnoo6LveMARPa7a8KWG2Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nfHJFtxdOgtxfL8bGvcbya4xrqDfq0X4ap6ZPPhlccn+oCJlmfee52k5DxySQrQ7I
 gnofBMPaGIDJHzG1qy/pgIKOPetWaJ9ZEXEuxpXgnh03m/XP0j5x1OIYjqOZb+ey0I
 yRGUOnzuPqvKvsCZ67Dmed4EWbcTjwy7IrLprXyiYOrLPHYrtQrmMkdRQrmjm2ys5c
 +RDg+ZzYaQgPQmp3IMZlMQQRQDj0U+SN199y+yfQ55xoTXs7xB/rn+tOjQcAZy/Uxh
 T6Ev7JBQZ7HjmffMQ5PsKeYwIv7ph2z61h16w+qR3+dYK+R+LQvKcrepo0m+5PvosT
 Oej4YjptoMV6Q==
Message-ID: <70a44ec7-8842-47d3-86d4-67dd173f9d82@kernel.org>
Date: Thu, 11 Jan 2024 11:05:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231228143152.1543509-1-chao@kernel.org>
 <20231228143152.1543509-6-chao@kernel.org> <ZZR4Tup3Lm3zh2V1@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZZR4Tup3Lm3zh2V1@google.com>
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/3 4:55, Jaegeuk Kim wrote: > On 12/28,
 Chao Yu wrote:
 >> We will encounter below inconsistent status when FAULT_BLKADDR type >>
 fault injection is on. >> >> Info: checkpoint state = d6 : nat [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNlO9-0006Qd-5x
Subject: Re: [f2fs-dev] [PATCH v3 6/6] f2fs: introduce
 FAULT_BLKADDR_INCONSISTENCE
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/1/3 4:55, Jaegeuk Kim wrote:
> On 12/28, Chao Yu wrote:
>> We will encounter below inconsistent status when FAULT_BLKADDR type
>> fault injection is on.
>>
>> Info: checkpoint state = d6 :  nat_bits crc fsck compacted_summary orphan_inodes sudden-power-off
>> [ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1c100 has i_blocks: 000000c0, but has 191 blocks
>> [FIX] (fsck_chk_inode_blk:1260)  --> [0x1c100] i_blocks=0x000000c0 -> 0xbf
>> [FIX] (fsck_chk_inode_blk:1269)  --> [0x1c100] i_compr_blocks=0x00000026 -> 0x27
>> [ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1cadb has i_blocks: 0000002f, but has 46 blocks
>> [FIX] (fsck_chk_inode_blk:1260)  --> [0x1cadb] i_blocks=0x0000002f -> 0x2e
>> [FIX] (fsck_chk_inode_blk:1269)  --> [0x1cadb] i_compr_blocks=0x00000011 -> 0x12
>> [ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1c62c has i_blocks: 00000002, but has 1 blocks
>> [FIX] (fsck_chk_inode_blk:1260)  --> [0x1c62c] i_blocks=0x00000002 -> 0x1
>>
>> After we inject fault into f2fs_is_valid_blkaddr() during truncation,
>> a) it missed to increase @nr_free or @valid_blocks
>> b) it can cause in blkaddr leak in truncated dnode
>> Which may cause inconsistent status.
>>
>> This patch separates FAULT_BLKADDR_INCONSISTENCE from FAULT_BLKADDR,
>> so that we can:
>> a) use FAULT_BLKADDR_INCONSISTENCE in f2fs_truncate_data_blocks_range()
>> to simulate inconsistent issue independently,
>> b) FAULT_BLKADDR fault will not cause any inconsistent status, we can
>> just use it to check error path handling in kernel side.
> 
> How about defining FAULT_BLKADDR_VALIDITY and FAULT_BLKADDR_CONSISTENCY?

Better, :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
