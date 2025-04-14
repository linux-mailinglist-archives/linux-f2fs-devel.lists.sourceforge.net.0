Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA84A88F2B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Apr 2025 00:36:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4SQ3-0003Uc-9P;
	Mon, 14 Apr 2025 22:36:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1u4SQ2-0003US-5a
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 22:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yD+hxaV++ePCtWluxERLvMHbAr5Dw8pT7Qznt0icRno=; b=ZLYKUdXf6ks9xI5oXcvz1RPjVu
 w/DYhJLSx1lPTZdnT3uRI+WkloKKYszA8+kaeU653Us+BpE3bPY5nVqoK89zQb7EFu22Ki5jgvch1
 OhaLL/ZNApaLAbLD8az87b1I0zMng3/1rKukOMZTPKpIen9Kv8KLbC+Mt8nW5aKDZ7k4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yD+hxaV++ePCtWluxERLvMHbAr5Dw8pT7Qznt0icRno=; b=cY4QIDJ0FQVLIlA+tKpWsAhKHN
 yEj4gXwzf52i2MiOCIKXndEVaSMhzg0iR7IvArZn/TlTavJUXp/AgEQSood3Jg5yLngRw4Uvoc7l2
 DYbjAq+vr2m0xBK/sfzvGlzrAl7MIACZkOfTEhib0idmu6rE+R4Kbgf/q6m6dLz213C4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4SPn-0007VJ-8r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 22:36:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BF9ED452CB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Apr 2025 22:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BEAC4CEE2;
 Mon, 14 Apr 2025 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744670185;
 bh=EpRDGHi9Xh3LwFXTUeEgoP3Kd9fRXASYRLBVWBm0A1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LKL3I5l4M+lIoZnD+KZ/wHi0Q018ze38KIurmaVhbp2QSXHQw9frkSB7dnwKnCH1I
 bCsIjLrHPY8GpIhhaMCv6DabjX45txU5pPx7+GOH0qMB/QrNwFYUfmN9219s0oBXS4
 CVl9RBuaCo7OaIovFqfvc4ELeCTDHL4gCjTjJNRR9c7ORDsjJR8sqSa6n5uoSSm4jc
 NcTwviYnuhjwWiHkVGa1QDZu1wNg7YyZyCeyuMv870cixlf8nzVlXPYE5VJQyz3cu2
 8K0qXM8pM9/GCRqefWGo7e3UvM+q6ZrXMdr+PqzxsPP/5jvWYbLzlbGEJ0LjB6GTIy
 ZVBZgrnLi2DDg==
Date: Mon, 14 Apr 2025 22:36:23 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Z_2N579A7r9aafa8@google.com>
References: <20250414023954.582146-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250414023954.582146-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  external/f2fs-tools/fsck/mount.c:584:4: error: 'snprintf'
 will always overflow; destination buffer has size 30, but size argument is
 31 [-Werror,-Wbuiltin-memcpy-chk-size] 584 | snprintf(str, 31, "%s[ [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4SPn-0007VJ-8r
Subject: Re: [f2fs-dev] [PATCH] dump.f2fs: support dump version_bitmap and
 chksum in checkpoint
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

external/f2fs-tools/fsck/mount.c:584:4: error: 'snprintf' will always overflow; destination buffer has size 30, but size argument is 31 [-Werror,-Wbuiltin-memcpy-chk-size]
  584 |                         snprintf(str, 31, "%s[%d]", i == NAT_BITMAP ?


On 04/14, Chao Yu wrote:
> dump.f2fs -d 1 img
> 
> ...
> checksum                      		[0x829fb462 : 2191504482]
> nat_version_bitmap[0]         		[0x       0 : 0]
> nat_version_bitmap[1]         		[0x       0 : 0]
> nat_version_bitmap[2]         		[0x       0 : 0]
> ...
> nat_version_bitmap[463]       		[0x       0 : 0]
> sit_version_bitmap[0]         		[0x       0 : 0]
> sit_version_bitmap[1]         		[0x       0 : 0]
> sit_version_bitmap[2]         		[0x       0 : 0]
> sit_version_bitmap[3]         		[0x       0 : 0]
> ...
> sit_version_bitmap[47]        		[0x       0 : 0]
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fsck/mount.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index e7c4069..6648c69 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -563,6 +563,33 @@ printout:
>  	printf("\n");
>  }
>  
> +void print_chksum(struct f2fs_checkpoint *cp)
> +{
> +	unsigned int crc = le32_to_cpu(*(__le32 *)((unsigned char *)cp +
> +						get_cp(checksum_offset)));
> +
> +	printf("%-30s" "\t\t[0x%8x : %u]\n", "checksum", crc, crc);
> +}
> +
> +void print_version_bitmap(struct f2fs_sb_info *sbi)
> +{
> +	char str[30];
> +	int i, j;
> +
> +	for (i = NAT_BITMAP; i <= SIT_BITMAP; i++) {
> +		unsigned int *bitmap = __bitmap_ptr(sbi, i);
> +		unsigned int size = round_up(__bitmap_size(sbi, i), 4);
> +
> +		for (j = 0; j < size; j++) {
> +			snprintf(str, 31, "%s[%d]", i == NAT_BITMAP ?
> +						"nat_version_bitmap" :
> +						"sit_version_bitmap", j);
> +			printf("%-30s" "\t\t[0x%8x : %u]\n", str,
> +						bitmap[i], bitmap[i]);
> +		}
> +	}
> +}
> +
>  void print_ckpt_info(struct f2fs_sb_info *sbi)
>  {
>  	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
> @@ -618,7 +645,9 @@ printout:
>  	DISP_u32(cp, checksum_offset);
>  	DISP_u64(cp, elapsed_time);
>  
> -	DISP_u32(cp, sit_nat_version_bitmap[0]);
> +	print_chksum(cp);
> +	print_version_bitmap(sbi);
> +
>  	printf("\n\n");
>  }
>  
> -- 
> 2.49.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
