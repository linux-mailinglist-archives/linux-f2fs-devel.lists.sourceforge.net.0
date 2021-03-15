Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D065A33A982
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Mar 2021 03:02:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lLcYQ-00067G-1k; Mon, 15 Mar 2021 02:01:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lLcYJ-00066O-8T
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 02:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vMtIyuRlkAWGZHdss3tzzEtyCHSoEHgRmHUuuIm1n8s=; b=Jh1q9sNzGSskNM2h+MNA4aZMrC
 t3kRm39PCwIh0i7KAO46irkThtkJwO9HDjThWW9fojeAuAle6l6Nd+mdR7R3qYkbUIt50ShGUuXIv
 mZ8ptZuu75m2jdFF3uRmYi78u4yPEhLBYa6GXYF3PDJlTMgie8X1oUqsK7uPlqD0th94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vMtIyuRlkAWGZHdss3tzzEtyCHSoEHgRmHUuuIm1n8s=; b=d46hctzhblLBmeQlX7iRgQsbSw
 LYruEcqsmGNrwQkxYKzXY/NHguzPTFjDnScF/Vm9IFNzfMXF3gchS9aDA2Qt8tdNS3xPalQdF+blm
 G54ufeUJjh3AiMBfM51tz3xKB4xUZx1QmSAukpFintc5dOzNHf24aY8XMZWIrmP35i3c=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lLcY1-0008QZ-N6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 02:01:44 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DzKN30Y3XzMh7c;
 Mon, 15 Mar 2021 09:58:59 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 15 Mar
 2021 10:01:16 +0800
To: Daniel Abrecht <linux-f2fs-devel@nodmarc.danielabrecht.ch>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <2f3255b625ce528ceb317b702ca7e0c2@abrecht.li>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d2f37346-ebfd-0641-185e-8a7b0302f1a6@huawei.com>
Date: Mon, 15 Mar 2021 10:01:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2f3255b625ce528ceb317b702ca7e0c2@abrecht.li>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lLcY1-0008QZ-N6
Subject: Re: [f2fs-dev] [PATCH] Add -P option to preserve file owner
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
Cc: jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/15 6:12, Daniel Abrecht wrote:
> I use user namespaces & debootstrap to bootstrap a system, and then
> copy that into an image using sload.f2fs. However, without an option to
> preserve the owner user & group of files, some files end up being owned
> by the wrong user / group (0:0), which causes all kinds of other issues
> 
> This patch adds an option -P to preserve the user and group of files.
> ---
>    fsck/main.c       | 6 +++++-
>    fsck/sload.c      | 5 +++++
>    include/f2fs_fs.h | 1 +
>    3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/fsck/main.c b/fsck/main.c
> index a538c72..8438b45 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -132,6 +132,7 @@ void sload_usage()
>    	MSG(0, "\nUsage: sload.f2fs [options] device\n");
>    	MSG(0, "[options]:\n");
>    	MSG(0, "  -C fs_config\n");
> +	MSG(0, "  -P preserve owner user and group\n");

preserve owner: user and group

How about adding an entry to describe this new option in manual of sload.f2fs?

Thanks,

>    	MSG(0, "  -f source directory [path of the source directory]\n");
>    	MSG(0, "  -p product out directory\n");
>    	MSG(0, "  -s file_contexts\n");
> @@ -549,7 +550,7 @@ void f2fs_parse_options(int argc, char *argv[])
>    #endif
>    	} else if (!strcmp("sload.f2fs", prog)) {
>    #ifdef WITH_SLOAD
> -		const char *option_string = "cL:a:i:x:m:rC:d:f:p:s:St:T:V";
> +		const char *option_string = "cL:a:i:x:m:rC:d:f:p:s:St:T:VP";
>    #ifdef HAVE_LIBSELINUX
>    		int max_nr_opt = (int)sizeof(c.seopt_file) /
>    			sizeof(c.seopt_file[0]);
> @@ -685,6 +686,9 @@ void f2fs_parse_options(int argc, char *argv[])
>    			case 'V':
>    				show_version(prog);
>    				exit(0);
> +			case 'P':
> +				c.preserve_perms = 1;
> +				break;
>    			default:
>    				err = EUNKNOWN_OPT;
>    				break;
> diff --git a/fsck/sload.c b/fsck/sload.c
> index 4dea78b..6929023 100644
> --- a/fsck/sload.c
> +++ b/fsck/sload.c
> @@ -187,6 +187,11 @@ static void set_inode_metadata(struct dentry *de)
>    	else
>    		de->mtime = c.fixed_time;
> 
> +	if (c.preserve_perms) {
> +		de->uid = stat.st_uid;
> +		de->gid = stat.st_gid;
> +	}
> +
>    	set_perms_and_caps(de);
>    }
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index a51a359..cdcce2c 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -505,6 +505,7 @@ struct f2fs_configuration {
>    	struct selinux_opt seopt_file[8];
>    	int nr_opt;
>    #endif
> +	int preserve_perms;
> 
>    	/* resize parameters */
>    	int safe_resize;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
