Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E5249282
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Aug 2020 03:44:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8D9N-0001LH-Co; Wed, 19 Aug 2020 01:44:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k8D9M-0001L4-62
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 01:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XlYKMYF7FGPB0OWnZr5CCul0Smf7PG2tjlITWqOz/H4=; b=jKNRJIGXPWhWUvQE+OdodCwRBd
 6nSJNEyR8Sw1JD3Tad/T1lV5vLNHSZS6X0wsfXAr6Okcc4mwr2INF/mW9lQTH7mwsR8xkdDOMwTB5
 lxjUx152Ghb96r2+g5cbD2zSsx4sMsV/prUutdWprqw32YVANwNWuXo+3DdZCs7hcsrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XlYKMYF7FGPB0OWnZr5CCul0Smf7PG2tjlITWqOz/H4=; b=PfbfDYZD5kJ0HrpwIoJ5Fz0Fc8
 g51ci2M0k+yzHPVpeYZtn2XhKZ7RbniBb79ZG1hVUgU4hqJYTQq5E7vRRGwC0cCDU35j7JW943D7u
 EsKBIl54CwJ1OO3pz7Y2jeTRtuFRFN4HDrACf6aHUMm1jqXGW3gp/PAR0CjjaFAdUcMI=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8D9K-00FiaH-KL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 01:44:24 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0B4998F3621CCDF53F23;
 Wed, 19 Aug 2020 09:44:04 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 19 Aug
 2020 09:44:02 +0800
To: Theotime Combes <tcombes@google.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200818111807.3287440-1-tcombes@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0809cb61-bffe-1722-d156-7fe40ac3bbe3@huawei.com>
Date: Wed, 19 Aug 2020 09:44:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200818111807.3287440-1-tcombes@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k8D9K-00FiaH-KL
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: add -r (fake_seed) flag
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

Hi Theotime,

The implementation looks clean to me, but could you please describe more
about what the problem will be caused by randomness for apex generation?

On 2020/8/18 19:18, Theotime Combes via Linux-f2fs-devel wrote:
> r flag sets the checkpointing seed to 0 (initially used to
> remove randomness for apex generation)
> 
> Signed-off-by: Theotime Combes <tcombes@google.com>
> ---
>   include/f2fs_fs.h       | 1 +
>   man/mkfs.f2fs.8         | 6 ++++++
>   mkfs/f2fs_format.c      | 2 +-
>   mkfs/f2fs_format_main.c | 6 +++++-
>   4 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index a9982f0..e6f996b 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -407,6 +407,7 @@ struct f2fs_configuration {
>   	__le32 feature;			/* defined features */
>   
>   	/* mkfs parameters */
> +	int fake_seed;
>   	u_int32_t next_free_nid;
>   	u_int32_t quota_inum;
>   	u_int32_t quota_dnum;
> diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
> index 022941f..d517165 100644
> --- a/man/mkfs.f2fs.8
> +++ b/man/mkfs.f2fs.8
> @@ -59,6 +59,9 @@ mkfs.f2fs \- create an F2FS file system
>   .B \-q
>   ]
>   [
> +.B \-r
> +]
> +[
>   .B \-R
>   .I root_owner
>   ]
> @@ -212,6 +215,9 @@ Default is disabled.
>   Quiet mode.
>   With it, mkfs.f2fs does not show any messages, including the basic messages.
>   .TP
> +.BI \-r
> +Sets the checkpointing srand seed to 0.
> +.TP
>   .BI \-R
>   Give root_owner option for initial uid/gid assignment.
>   Default is set by getuid()/getgid(), and assigned by "-R $uid:$gid".
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 1639752..d31cca4 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -692,7 +692,7 @@ static int f2fs_write_check_point_pack(void)
>   	}
>   
>   	/* 1. cp page 1 of checkpoint pack 1 */
> -	srand(time(NULL));
> +	srand((c.fake_seed) ? 0 : time(NULL));
>   	cp->checkpoint_ver = cpu_to_le64(rand() | 0x1);
>   	set_cp(cur_node_segno[0], c.cur_seg[CURSEG_HOT_NODE]);
>   	set_cp(cur_node_segno[1], c.cur_seg[CURSEG_WARM_NODE]);
> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> index 27c1f1d..ac9d8c8 100644
> --- a/mkfs/f2fs_format_main.c
> +++ b/mkfs/f2fs_format_main.c
> @@ -59,6 +59,7 @@ static void mkfs_usage()
>   	MSG(0, "  -C [encoding[:flag1,...]] Support casefolding with optional flags\n");
>   	MSG(0, "  -p number of pinned segments (2MB) [default:0]\n");
>   	MSG(0, "  -q quiet mode\n");
> +	MSG(0, "  -r set checkpointing seed (srand()) to 0\n");
>   	MSG(0, "  -R root_owner [default: 0:0]\n");
>   	MSG(0, "  -s # of segments per section [default:1]\n");
>   	MSG(0, "  -S sparse mode\n");
> @@ -124,7 +125,7 @@ static void add_default_options(void)
>   
>   static void f2fs_parse_options(int argc, char *argv[])
>   {
> -	static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:R:s:S:z:t:U:Vfw:";
> +	static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:rR:s:S:z:t:U:Vfw:";
>   	int32_t option=0;
>   	int val;
>   	char *token;
> @@ -187,6 +188,9 @@ static void f2fs_parse_options(int argc, char *argv[])
>   		case 'p':
>   			c.pinned_segments = atof(optarg);
>   			break;
> +		case 'r':
> +			c.fake_seed = 1;
> +			break;
>   		case 'R':
>   			if (parse_root_owner(optarg, &c.root_uid, &c.root_gid))
>   				mkfs_usage();
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
