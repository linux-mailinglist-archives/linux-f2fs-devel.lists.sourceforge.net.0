Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E223638ABC7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 May 2021 13:26:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ljgp4-0000Dt-JQ; Thu, 20 May 2021 11:26:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1ljgp3-0000DS-Hv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 May 2021 11:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n9q1seSie1DIs1rEjD/6g5tLLyCpN32Hc8WC1CtMlGw=; b=I/x3l7mKpa7Yy8Ee+MCWR+7xnr
 ujxN8/qk8oL128r/04nWuchFpN+a+HlEggYCfTLeZyZ4sK2denQqVkS2yDjU+Ig3TQfxePpf3ZwfA
 cdOLOZFcoxPV2BRIKUPeGFillE5cUUAbGDGH2G3wxG7YwH/nBbiRrGpszhY1SDSCln9k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n9q1seSie1DIs1rEjD/6g5tLLyCpN32Hc8WC1CtMlGw=; b=elhWLMbDqfvJb3a1wAgh3RCX+G
 SLHysHyktQRjgnmpk9tDl6+DUPSr39IOkYAKU4hsDgIc63UeC3f+tPTBxQ4NdeOitaYOT0/Y7r08L
 qcox9sznbo/BsJhikSvXluj9wOD/ed97p1br99ceftNAgTgVQsW6oR2BBMEH5qoDxq9A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ljgou-00GORq-B9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 May 2021 11:26:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F6E2611BD;
 Thu, 20 May 2021 11:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621509982;
 bh=2PBd7z120PcFEdndWzKY+V34iwlaKBvxidmcu+vPNrE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=SSCRx0A7PLTt3by9kA3Sji7UHO6/W4tOxdQbu932vz3Z3LvR67/rByCMiEoIg01Sp
 V5Yf1mb3/5x9cY+wU3mBppdvbgxlffFYv4sqvlRgRoapI9oSI9yvMtxlvTVuD1t3sW
 z8IICNus4W9FFgS1sAD92CFQt1n1rngo12GNiOdbwvY4owe21gm9ujIgpIu2QLVJxQ
 LaS0NS6JJuGMUSjBbXMFCpHmrIKKGxKFG/I0KjREmwrt3kJyKY99l1+iIwPa9YHpak
 X1tVBR47dCa4EJPrLxu/pGIVdX8GDKs7XGjtgD8SPuuHs0aMDzcmNJ1BNjFMGaSpXn
 NxWJMepOKn5Cg==
To: Dongwoo Lee <dwoo08.lee@samsung.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CGME20210512090846epcas1p1c19254a0f25b579c697a497fe94f68ad@epcas1p1.samsung.com>
 <20210512090842.162973-1-dwoo08.lee@samsung.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <d8a50e74-be7e-3242-c3af-2fc6b8ad10b8@kernel.org>
Date: Thu, 20 May 2021 19:26:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210512090842.162973-1-dwoo08.lee@samsung.com>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ljgou-00GORq-B9
Subject: Re: [f2fs-dev] [PATCH v2] tools: Introduce f2fslabel
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

On 2021/5/12 17:08, Dongwoo Lee wrote:
> Although many other filesystems provide a tool for changing volume
> label, e.g. e2label for ext filesystem, but f2fs has no way to change
> volume label except set it while formatting with mkfs.f2fs.
> 
> This introduces f2fslabel, simple tool for changing label of f2fs
> volume.
> 
> Signed-off-by: Dongwoo Lee <dwoo08.lee@samsung.com>
> ---
> 
> Changes in v2:
> - Integrated into fsck/main.c instead of individual tool
> 
>   fsck/Makefile.am  |  1 +
>   fsck/main.c       | 79 +++++++++++++++++++++++++++++++++++++++++++++++
>   include/f2fs_fs.h |  2 ++
>   man/Makefile.am   |  2 +-
>   man/f2fslabel.8   | 33 ++++++++++++++++++++
>   5 files changed, 116 insertions(+), 1 deletion(-)
>   create mode 100644 man/f2fslabel.8
> 
> diff --git a/fsck/Makefile.am b/fsck/Makefile.am
> index e7d599c..e31d416 100644
> --- a/fsck/Makefile.am
> +++ b/fsck/Makefile.am
> @@ -18,3 +18,4 @@ install-data-hook:
>   	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/defrag.f2fs
>   	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/resize.f2fs
>   	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/sload.f2fs
> +	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/f2fslabel
> diff --git a/fsck/main.c b/fsck/main.c
> index 64efa87..6a9668a 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -155,6 +155,14 @@ void sload_usage()
>   	exit(1);
>   }
>   
> +void label_usage()
> +{
> +	MSG(0, "\nUsage: f2fslabel [options] device [volume-label]\n");
> +	MSG(0, "[options]:\n");
> +	MSG(0, "  -V print the version number and exit\n");
> +	exit(1);
> +}
> +
>   static int is_digits(char *optarg)
>   {
>   	unsigned int i;
> @@ -177,6 +185,8 @@ static void error_out(char *prog)
>   		resize_usage();
>   	else if (!strcmp("sload.f2fs", prog))
>   		sload_usage();
> +	else if (!strcmp("f2fslabel", prog))
> +		label_usage();
>   	else
>   		MSG(0, "\nWrong program.\n");
>   }
> @@ -722,6 +732,39 @@ void f2fs_parse_options(int argc, char *argv[])
>   			}
>   		}
>   #endif /* WITH_SLOAD */
> +	} else if (!strcmp("f2fslabel", prog)) {
> +#ifdef WITH_LABEL
> +		const char *option_string = "V";
> +
> +		c.func = LABEL;
> +		while ((option = getopt(argc, argv, option_string)) != EOF) {
> +			switch (option) {
> +			case 'V':
> +				show_version(prog);
> +				exit(0);
> +			default:
> +				err = EUNKNOWN_OPT;
> +				break;
> +			}
> +			if (err != NOERROR)
> +				break;
> +		}
> +
> +		if (argc > (optind + 2)) { /* unknown argument(s) is(are) passed */
> +			optind += 2;
> +			err = EUNKNOWN_ARG;
> +		} else if (argc == (optind + 2)) { /* change label */
> +			c.vol_label = strdup(argv[optind + 1]);
> +			argc--;
> +		} else { /* print label */
> +			/*
> +			 * Since vol_label was initialized as "", in order to
> +			 * distinguish between clear label and print, set
> +			 * vol_label as NULL for print case
> +			 */
> +			c.vol_label = NULL;
> +		}
> +#endif /* WITH_LABEL */
>   	}
>   
>   	if (err == NOERROR) {
> @@ -971,6 +1014,36 @@ static int do_sload(struct f2fs_sb_info *sbi)
>   }
>   #endif
>   
> +#ifdef WITH_LABEL
> +static int do_label(struct f2fs_sb_info *sbi)
> +{
> +	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
> +
> +	if (!c.vol_label) {
> +		char label[MAX_VOLUME_NAME];
> +
> +		utf16_to_utf8(label, sb->volume_name,
> +			      MAX_VOLUME_NAME, MAX_VOLUME_NAME);
> +		MSG(0, "Info: volume label = %s\n", label);
> +		return 0;
> +	}
> +
> +	if (strlen(c.vol_label) > MAX_VOLUME_NAME) {
> +		ERR_MSG("Label should not exceed %d characters\n", MAX_VOLUME_NAME);
> +		return -1;
> +	}
> +
> +	utf8_to_utf16(sb->volume_name, (const char *)c.vol_label,
> +		      MAX_VOLUME_NAME, strlen(c.vol_label));
> +
> +	update_superblock(sb, SB_MASK_ALL);
> +
> +	MSG(0, "Info: volume label is changed to %s\n", c.vol_label);

It needs to free c.vol_label here?

Thanks,

> +
> +	return 0;
> +}
> +#endif
> +
>   #if defined(__APPLE__)
>   static u64 get_boottime_ns()
>   {
> @@ -1084,6 +1157,12 @@ fsck_again:
>   		c.func = FSCK;
>   		c.fix_on = 1;
>   		goto fsck_again;
> +#endif
> +#ifdef WITH_LABEL
> +	case LABEL:
> +		if (do_label(sbi))
> +			goto out_err;
> +		break;
>   #endif
>   	default:
>   		ERR_MSG("Wrong program name\n");
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index cdcce2c..5d49ed1 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -35,6 +35,7 @@
>   #define WITH_DEFRAG
>   #define WITH_RESIZE
>   #define WITH_SLOAD
> +#define WITH_LABEL
>   #endif
>   
>   #include <inttypes.h>
> @@ -343,6 +344,7 @@ enum f2fs_config_func {
>   	DEFRAG,
>   	RESIZE,
>   	SLOAD,
> +	LABEL,
>   };
>   
>   enum default_set {
> diff --git a/man/Makefile.am b/man/Makefile.am
> index 1d16c6f..9363b82 100644
> --- a/man/Makefile.am
> +++ b/man/Makefile.am
> @@ -1,3 +1,3 @@
>   ## Makefile.am
>   
> -dist_man_MANS = mkfs.f2fs.8 fsck.f2fs.8 dump.f2fs.8 defrag.f2fs.8 resize.f2fs.8 sload.f2fs.8 f2fs_io.8
> +dist_man_MANS = mkfs.f2fs.8 fsck.f2fs.8 dump.f2fs.8 defrag.f2fs.8 resize.f2fs.8 sload.f2fs.8 f2fs_io.8 f2fslabel.8
> diff --git a/man/f2fslabel.8 b/man/f2fslabel.8
> new file mode 100644
> index 0000000..848ed3b
> --- /dev/null
> +++ b/man/f2fslabel.8
> @@ -0,0 +1,33 @@
> +.\" Copyright (c) 2021 Samsung Electronics Co., Ltd.
> +.\"
> +.TH F2FSLABEL 8
> +.SH NAME
> +f2fslabel \- Change the label on an f2fs volume
> +.SH SYNOPSIS
> +.B f2fslabel
> +.I device
> +[
> +.I volume-label
> +]
> +.SH DESCRIPTION
> +.B f2fslabel
> +will display or change the volume label on the f2fs located on
> +.I device.
> +.PP
> +If the optional argument
> +.I volume-label
> +is present, then
> +.B f2fslabel
> +will set the volume label to be
> +.IR volume-label .
> +.PP
> +Otherwise,
> +.B f2fslabel
> +will simply show the current label.
> +.PP
> +.SH AUTHOR
> +.B f2fslabel
> +was written by Dongwoo Lee (dwoo08.lee@samsung.com).
> +.SH AVAILABILITY
> +.B f2fslabel
> +is available from git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
