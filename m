Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E90543D0A38
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jul 2021 10:04:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m67DO-0000VC-SD; Wed, 21 Jul 2021 08:04:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1m67DN-0000V4-FK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Jul 2021 08:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t2rYi7Gbv1vk0aHbb9UImwN4WBzy7ugMo/eZwyN0AqA=; b=asYa+67WYY00uJxRdrk765Gz/i
 PZuUHWVxndS9UynLE+3gjQ3YckFVawbyuHc8y1qX1BBqxXz4a34VSRQKUExrzGVCv1o/x/ehTLY6Y
 zHjBuEYCnimdCCGLWOMfD3D69jgKR5dr+lbIsAg2ILSUYQq7x1jEoekYrAYrBJ9ld4BA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t2rYi7Gbv1vk0aHbb9UImwN4WBzy7ugMo/eZwyN0AqA=; b=SuBhQ7r76imo3iWIL2b5/YwJX5
 WWP12F1V+5B/yoaCRqw35ktCe0vZMgokz4IAbtjufrbsiKjiDh/DhirCnBkE+4UqgJjxigYG25O9w
 2pki+zg5PNI0x/3ldB4OuCCviQeHD7BJUeE4yBaqhFQLczag8feZ8GC+MNRSmiSZrjb8=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m67DJ-0004lB-Qi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Jul 2021 08:04:25 +0000
DKIM-Signature: a=rsa-sha256;
 b=N2yW9VXxITglAGqQKfY6JQX0Ipg7HUpCgTBL2v2pZXJojTZGDtLQCXupmX9meFL6KHLbDRXiDYLs3NiwO3oNhJiriVp2fkUR51sN+ZrzLj7Ta9EtA7HRY7YJIOFndKt5DfTVpCJZWc+QIC0ZUXDynEoDoFUbqu7IWKyBSGAsTBU=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=t2rYi7Gbv1vk0aHbb9UImwN4WBzy7ugMo/eZwyN0AqA=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.25.44.145] (unknown [58.250.176.229])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 4DD1AAC03B2;
 Wed, 21 Jul 2021 16:04:12 +0800 (CST)
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20210702031138.156851-1-changfengnan@vivo.com>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <853716fe-5f1f-09e8-5b15-8b568e435b20@vivo.com>
Date: Wed, 21 Jul 2021 16:04:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210702031138.156851-1-changfengnan@vivo.com>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRpDThhWHUNDSk5KQxhOGR
 1DVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITk9VS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NFE6Kjo6TT9PIlEUTEpWLA0o
 OT9PFDBVSlVKTUlNQ05PTU5JQkxPVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQUlKSU43Bg++
X-HM-Tid: 0a7ac817fa04b039kuuu4dd1aac03b2
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.144 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1m67DJ-0004lB-Qi
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: allow write compress
 released file after truncate to zero
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi jaegeuk,chao:

     How about this version ?


On 2021/7/2 11:11, Fengnan Chang wrote:
> We should allow write compress released file after truncate to zero.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/file.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6afd4562335f..684fc2e8d8a4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -740,6 +740,13 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
>   		return err;
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> +	/*
> +	 * We should allow write compress released file
> +	 * after truncate to zero.
> +	 */
> +	if (f2fs_compressed_file(inode) && !free_from)
> +		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
> +
>   	if (from != free_from) {
>   		err = f2fs_truncate_partial_cluster(inode, from, lock);
>   		if (err)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
