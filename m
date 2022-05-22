Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF86530322
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 May 2022 14:44:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nskwU-000073-LX; Sun, 22 May 2022 12:44:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nskwT-00006w-C3
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 May 2022 12:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6KbHIXF7N9Dlyw5KImDqQ94RjAx50SYBK6rjfiVp8s4=; b=lNE8SJqey8n1Z8nOi2RS7SQ4Pp
 jxpN8Kvcxmyp+M4E8QVidxev5srVVx3lFxNIYPEo3trIahcwne333bCth+30yM/kF/W4aJJW7mi7S
 Ow31ugcHZ0CNVqTWv58hsjDtql94xf2VE3SfGp/eGYRmDyDsuOZf7EJABtGysHbru16A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6KbHIXF7N9Dlyw5KImDqQ94RjAx50SYBK6rjfiVp8s4=; b=g5D2OKQl/nLgpkjWTqf4tBfNPS
 7exhE6/m/JZ5I+LcQW+pks8dCxpUK9UD2qwL0HZZ/700tJjs3vRhQC6vAkFHP0pi64THYZqmYZHDq
 iqCWFqX58tjulHWykuC28hH9EsPkO9OJ0lhs7Ub+G4JkIBz2Q7saHxGxClKSuqg4w8Qc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nskwN-0007mI-Ul
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 May 2022 12:44:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3ADFEB80B05;
 Sun, 22 May 2022 12:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1534CC385AA;
 Sun, 22 May 2022 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653223439;
 bh=DEteYEjM+AM/wXkRopNu1+2DJQAvofJ3C+iGOSkSiPA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aHQE+A/MzK8H3SZ55YRN+/j56oazYVYQ9CsJl4y5fwEWnyK/Mijf4P0TQydnVpQTW
 dHM6eZx5jem8IvprgD7NqgxO7DjguXTtSlODsjo8H2B9v/8FQjojehfc/XAMeZM8bL
 ur1UaNIQs+WL1Pu3JhBL3yoydHFApgCNfj66Sbtz9vdJ8gzoqFOs+SmpR2SMNCrMue
 lZqyuGuBssNW3FLeP/nJ2nzczX0+mGiihmn/KXi8J22SPPSPFJodYDl/hYrOwYCjSZ
 H6yELqghWGGdFqkfNOI+CbFPtmCZiNqY5l/8g1s+45D9DQuVUJxKw700UcYjtHvIE2
 yr6ayKVyAJbdQ==
Message-ID: <dd1ea728-4cb6-e35d-dc76-a1d62bead69a@kernel.org>
Date: Sun, 22 May 2022 20:43:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20220428181809.2352352-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220428181809.2352352-1-daeho43@gmail.com>
X-Spam-Score: -7.0 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: On 2022/4/29 2:18, Daeho Jeong wrote:> + *old_addr =
 dn.data_blkaddr; 
 > + f2fs_truncate_data_blocks_range(&dn, 1); > + dec_valid_block_count(sbi,
 F2FS_I(inode)->cow_inode, count); > + inc_valid_block_ [...] 
 Content analysis details:   (-7.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nskwN-0007mI-Ul
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: change the current atomic write way
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/4/29 2:18, Daeho Jeong wrote:> +		*old_addr = dn.data_blkaddr;
> +		f2fs_truncate_data_blocks_range(&dn, 1);
> +		dec_valid_block_count(sbi, F2FS_I(inode)->cow_inode, count);
> +		inc_valid_block_count(sbi, inode, &count);
> +		f2fs_replace_block(sbi, &dn, dn.data_blkaddr, new_addr,
> +					ni.version, true, false);

My concern is, if cow_inode's data was persisted into previous checkpoint,
and then f2fs_replace_block() will update SSA from cow_inode to inode?
it will cause inconsistent status of last valid checkpoint? Or am I mssing
something?

> -		f2fs_submit_merged_write_cond(sbi, inode, NULL, 0, DATA);
> +			new = f2fs_kmem_cache_alloc(revoke_entry_slab, GFP_NOFS,
> +							true, NULL);
> +			if (!new) {
> +				f2fs_put_dnode(&dn);
> +				ret = -ENOMEM;
> +				goto out;

It doesn't need to handle failure of f2fs_kmem_cache_alloc()
due to nofail parameter is true.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
