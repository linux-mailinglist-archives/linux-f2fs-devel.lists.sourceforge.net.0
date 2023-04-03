Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2136D451A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 15:01:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjJoO-0001bC-Fw;
	Mon, 03 Apr 2023 13:01:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pjJoM-0001aw-Rh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 13:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=18OljrLvohgVHVJmok1MzNeTC8OLz0B1xybeEP8HT2I=; b=XJrizSRqBNQ+0UjbZNnZOgqOz0
 aI1YaZWQ+ZEBBA/ydz3Al+BdjkL4McY78u7+IUQOqfji6qoyE6IoK3HA0S+wk8BdfAcRbxhPfW6F7
 nOxloPMVPoQvdzIkoKjDC2STFoVALExTR8ZS90TFo67BmE9XJtpMRR/LwyMcVjUxSz+U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=18OljrLvohgVHVJmok1MzNeTC8OLz0B1xybeEP8HT2I=; b=KuUqKxA+6CkrS70kENooUeGsye
 FIn0djrkxCLMqp72ipurOTFugTaUjG2/BR58ZTdsDijdSbksocAAU5hGOl6h5gDgdSffiWctw736C
 yFVsaGSZSXebY+YjhmQvDISE+6XFQw+R6ocaqdLRDtThBqHrbvK84IkfExeSZsXLAaQE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjJoH-0005up-CN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 13:01:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19D9DB819FE;
 Mon,  3 Apr 2023 13:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF45C433EF;
 Mon,  3 Apr 2023 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680526874;
 bh=g/q8ngs4Lu/XegEcYRioVig8rL6D71grOapwpDbVTOo=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=uW0IlYK6d7/1tAI61Dr3NSBAlzyMu4EYjjaQkgTMTR7giO/8fCRs4dKJrrgWWg0h3
 zUf78t2zcWEvtHugaeP61GQPCSHRXVXKA2cREavEONlTHf9L/DdAK2mm7LLD5twY/L
 BGb5AKwnAvBm7xP1dC41QcopgaRqDikLiWFe/tYoH866l2WDiDC57lA+SFKdwl0e2R
 zoQ296bcXnprpBQ6UA7+0YUincMGNmaTTsfQpbAErQjwRWgV7yWbsnICTNWDKbPJ2k
 TntETNczHo8CNxP8cgK/xinQUc0eTjvYEo/TJ2zxTLgOOxCiI5JNwpzdMtly8tdiCT
 YscaoAN7/cSiA==
Message-ID: <b2f84d00-6f6f-8be2-fbfc-0a764fb0b032@kernel.org>
Date: Mon, 3 Apr 2023 21:01:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Nick Terrell <terrelln@fb.com>
References: <20230330162811.18923-1-frank.li@vivo.com>
 <d87f168e-6155-3784-48f5-03c551c589f7@kernel.org>
In-Reply-To: <d87f168e-6155-3784-48f5-03c551c589f7@kernel.org>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/3 11:46, Chao Yu wrote: > On 2023/3/31 0:28,
 Yangtao
 Li wrote: >> Commit 3fde13f817e2 ("f2fs: compress: support compress level")
 >> forgot to do basic compress level check, let's add it. >> [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjJoH-0005up-CN
Subject: Re: [f2fs-dev] [RESEND] f2fs: add sanity compress level check for
 compressed file
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

On 2023/4/3 11:46, Chao Yu wrote:
> On 2023/3/31 0:28, Yangtao Li wrote:
>> Commit 3fde13f817e2 ("f2fs: compress: support compress level")
>> forgot to do basic compress level check, let's add it.
>>
>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>> ---
>>    fs/f2fs/inode.c             | 94 +++++++++++++++++++++++++------------
>>    include/linux/zstd_lib.h    |  3 ++
>>    lib/zstd/compress/clevels.h |  4 --
>>    3 files changed, 67 insertions(+), 34 deletions(-)
>>
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index bb5b365a195d..e63f75168700 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -10,6 +10,8 @@
>>    #include <linux/buffer_head.h>
>>    #include <linux/writeback.h>
>>    #include <linux/sched/mm.h>
>> +#include <linux/lz4.h>
>> +#include <linux/zstd.h>
>>    
>>    #include "f2fs.h"
>>    #include "node.h"
>> @@ -202,6 +204,66 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
>>    	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
>>    }
>>    
>> +static bool sanity_check_compress_inode(struct inode *inode,
>> +			struct f2fs_inode *ri)
>> +{
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>> +	unsigned char compress_level;
>> +
>> +	if (ri->i_compress_algorithm >= COMPRESS_MAX) {
>> +		set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +		f2fs_warn(sbi,
>> +			"%s: inode (ino=%lx) has unsupported compress algorithm: %u, run fsck to fix",
>> +			__func__, inode->i_ino, ri->i_compress_algorithm);
>> +		return false;
>> +	}
>> +	if (le64_to_cpu(ri->i_compr_blocks) >
>> +			SECTOR_TO_BLOCK(inode->i_blocks)) {
>> +		set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +		f2fs_warn(sbi,
>> +			"%s: inode (ino=%lx) has inconsistent i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
>> +			__func__, inode->i_ino, le64_to_cpu(ri->i_compr_blocks),
>> +			SECTOR_TO_BLOCK(inode->i_blocks));
>> +		return false;
>> +	}
>> +	if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
>> +		ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
>> +		set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +		f2fs_warn(sbi,
>> +			"%s: inode (ino=%lx) has unsupported log cluster size: %u, run fsck to fix",
>> +			__func__, inode->i_ino, ri->i_log_cluster_size);
>> +		return false;
>> +	}
>> +
>> +	compress_level = le16_to_cpu(ri->i_compress_flag) >> COMPRESS_LEVEL_OFFSET;
> 
> Exceed 80 lines.

Sorry, colunms... out of my mind.

> 
>> +	switch (ri->i_compress_algorithm) {
>> +	case COMPRESS_LZO:
>> +	case COMPRESS_LZORLE:
>> +		if (compress_level)
>> +			goto err;
>> +		break;
>> +	case COMPRESS_LZ4:
>> +		if ((compress_level && compress_level < LZ4HC_MIN_CLEVEL) ||
>> +				compress_level > LZ4HC_MAX_CLEVEL)
>> +			goto err;
>> +		break;
>> +	case COMPRESS_ZSTD:
>> +		if (!compress_level || compress_level > ZSTD_MAX_CLEVEL)
>> +			goto err;
>> +		break;
>> +	default:
>> +		goto err;
>> +	}
>> +
>> +	return true;
>> +
>> +err:
>> +	set_sbi_flag(sbi, SBI_NEED_FSCK);
>> +	f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported compress level: %u, run fsck to fix",
>> +		  __func__, inode->i_ino, compress_level);
>> +	return false;
>> +}
>> +
>>    static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>>    {
>>    	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>> @@ -285,36 +347,8 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>>    
>>    	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
>>    			fi->i_flags & F2FS_COMPR_FL &&
>> -			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
>> -						i_log_cluster_size)) {
>> -		if (ri->i_compress_algorithm >= COMPRESS_MAX) {
>> -			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> -			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
>> -				"compress algorithm: %u, run fsck to fix",
>> -				  __func__, inode->i_ino,
>> -				  ri->i_compress_algorithm);
>> -			return false;
>> -		}
>> -		if (le64_to_cpu(ri->i_compr_blocks) >
>> -				SECTOR_TO_BLOCK(inode->i_blocks)) {
>> -			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> -			f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
>> -				"i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
>> -				  __func__, inode->i_ino,
>> -				  le64_to_cpu(ri->i_compr_blocks),
>> -				  SECTOR_TO_BLOCK(inode->i_blocks));
>> -			return false;
>> -		}
>> -		if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
>> -			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
>> -			set_sbi_flag(sbi, SBI_NEED_FSCK);
>> -			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
>> -				"log cluster size: %u, run fsck to fix",
>> -				  __func__, inode->i_ino,
>> -				  ri->i_log_cluster_size);
>> -			return false;
>> -		}
>> -	}
>> +			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_log_cluster_size))
> 
> Exceed 80 lines.

Ditto.

Thanks,

> 
>> +		sanity_check_compress_inode(inode, ri);
> 
> Missed to check return value?
> 
>>    
>>    	return true;
>>    }
>> diff --git a/include/linux/zstd_lib.h b/include/linux/zstd_lib.h
>> index 79d55465d5c1..ff55f41c73d3 100644
>> --- a/include/linux/zstd_lib.h
>> +++ b/include/linux/zstd_lib.h
>> @@ -88,6 +88,9 @@ ZSTDLIB_API const char* ZSTD_versionString(void);
>>    #  define ZSTD_CLEVEL_DEFAULT 3
>>    #endif
>>    
>> +/*-=====  Pre-defined compression levels  =====-*/
>> +#define ZSTD_MAX_CLEVEL     22
>> +
>>    /* *************************************
>>     *  Constants
>>     ***************************************/
>> diff --git a/lib/zstd/compress/clevels.h b/lib/zstd/compress/clevels.h
>> index d9a76112ec3a..b040d9d29089 100644
>> --- a/lib/zstd/compress/clevels.h
>> +++ b/lib/zstd/compress/clevels.h
>> @@ -14,10 +14,6 @@
>>    #define ZSTD_STATIC_LINKING_ONLY  /* ZSTD_compressionParameters  */
>>    #include <linux/zstd.h>
>>    
>> -/*-=====  Pre-defined compression levels  =====-*/
>> -
>> -#define ZSTD_MAX_CLEVEL     22
> 
> Why not zstd_max_clevel()?
> 
> Thanks,
> 
>> -
>>    __attribute__((__unused__))
>>    
>>    static const ZSTD_compressionParameters ZSTD_defaultCParameters[4][ZSTD_MAX_CLEVEL+1] = {
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
