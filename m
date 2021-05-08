Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5943B377015
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 May 2021 08:29:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lfGSp-00050P-Ir; Sat, 08 May 2021 06:29:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lfGSn-000504-7O
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 May 2021 06:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WrpEMZaL6OV787ZcxEC99jZI512KvuVoUmXBhs5+E2w=; b=H2RZ9w2s6gsOBVnv8hNN/nBDuz
 rkAGRZgg+ho4PLHvrj4qk2OsAJ0aDk5psfplgYx/vVbikRJmlPjEz3UDl/Cm6M+6BQ8ZP7ZNumIAT
 TZKBCaNBzpNUtiYGvYrR7NtQ59JU+dTUg6kZWRk4i8W9mHzh0SRjkg6JQk/RTG1qPPqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WrpEMZaL6OV787ZcxEC99jZI512KvuVoUmXBhs5+E2w=; b=F4/2xPNsatgSa+Ashq05XSVfOy
 7s3yqsm1/oYaVlJjqHOtE7W2zWFDlhmVguJghrxsWHnb+oj3ikWHS5kCQkL3hdrRrYgpM7OeVYHMC
 5SLiGvZCVOWs4joBs4/njgo3HAcUXBgrI8G77V0rAS65AxAYff8N8dp0NV3XWEAJRHFE=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lfGSc-000723-Am
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 May 2021 06:29:20 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fcclh3vJCz1BHrP;
 Sat,  8 May 2021 14:26:24 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sat, 8 May 2021
 14:28:57 +0800
To: Dongwoo Lee <dwoo08.lee@samsung.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <CGME20210503072707epcas1p265555022f85b62cd9f6780fcc34160a6@epcas1p2.samsung.com>
 <20210503072703.733501-1-dwoo08.lee@samsung.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <903f4d26-29e1-b362-47ed-bf95de2b9e6f@huawei.com>
Date: Sat, 8 May 2021 14:28:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210503072703.733501-1-dwoo08.lee@samsung.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lfGSc-000723-Am
Subject: Re: [f2fs-dev] [PATCH] tools: Introduce f2fslabel
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

On 2021/5/3 15:27, Dongwoo Lee wrote:
> Although many other filesystems provide a tool for changing volume
> label, e.g. e2label for ext filesystem, but f2fs has no way to change
> volume label except set it while formatting with mkfs.f2fs.
> 
> This introduces f2fslabel, simple tool for changing label of f2fs
> volume.
> 
> Signed-off-by: Dongwoo Lee <dwoo08.lee@samsung.com>
> ---
>   man/Makefile.am   |   2 +-
>   man/f2fslabel.8   |  33 ++++++++++
>   tools/Makefile.am |   4 +-
>   tools/f2fslabel.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 186 insertions(+), 2 deletions(-)
>   create mode 100644 man/f2fslabel.8
>   create mode 100644 tools/f2fslabel.c
> 
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
> diff --git a/tools/Makefile.am b/tools/Makefile.am
> index 56bf2e4..84f0ae4 100644
> --- a/tools/Makefile.am
> +++ b/tools/Makefile.am
> @@ -2,10 +2,12 @@
>   
>   AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
>   AM_CFLAGS = -Wall
> -sbin_PROGRAMS = f2fstat fibmap.f2fs parse.f2fs
> +sbin_PROGRAMS = f2fstat fibmap.f2fs parse.f2fs f2fslabel
>   f2fstat_SOURCES = f2fstat.c
>   fibmap_f2fs_SOURCES = fibmap.c
>   parse_f2fs_SOURCES = f2fs_io_parse.c
> +f2fslabel_SOURCES = f2fslabel.c
> +f2fslabel_LDADD = $(top_builddir)/lib/libf2fs.la
>   
>   if LINUX
>   sbin_PROGRAMS += f2fscrypt
> diff --git a/tools/f2fslabel.c b/tools/f2fslabel.c
> new file mode 100644
> index 0000000..3af845c
> --- /dev/null
> +++ b/tools/f2fslabel.c
> @@ -0,0 +1,149 @@
> +#include <f2fs_fs.h>
> +#include <fcntl.h>
> +
> +enum SB_ADDR {
> +	SB0_ADDR = 0,
> +	SB1_ADDR,
> +	SB_MAX_ADDR,
> +};
> +
> +#define SB_MASK(i)	(1 << (i))
> +#define SB_MASK_ALL	(SB_MASK(SB0_ADDR) | SB_MASK(SB1_ADDR))
> +
> +struct f2fs_super_block sb_raw;
> +
> +static int verify_sb_chksum(struct f2fs_super_block *sb)
> +{
> +	if (get_sb(checksum_offset) != SB_CHKSUM_OFFSET)
> +		return -1;
> +
> +	if (f2fs_crc_valid(get_sb(crc), sb, get_sb(checksum_offset)))
> +		return -1;
> +
> +	return 0;
> +}

How about reusing existed verify_sb_chksum() to avoid duplicated codes?

> +
> +static int read_and_check_sb(enum SB_ADDR sb_addr)
> +{
> +	char buf[F2FS_BLKSIZE];
> +	struct f2fs_super_block *sb = &sb_raw;
> +
> +	if (dev_read_block(buf, sb_addr))
> +		return -1;
> +
> +	memcpy(sb, buf + F2FS_SUPER_OFFSET, sizeof(struct f2fs_super_block));
> +
> +	if ((get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) &&
> +	    verify_sb_chksum(sb))
> +		return -1;
> +
> +	if (get_sb(magic) != F2FS_SUPER_MAGIC)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static int open_sb(int mode)
> +{
> +	struct device_info *dev = &c.devices[0];
> +	int ret;
> +
> +	ret = open(dev->path, mode);
> +	if (ret < 0) {
> +		perror(dev->path);
> +		fprintf(stderr, "f2fslabel: Failed to open device: %s\n",
> +			dev->path);
> +		exit(1);
> +	}
> +
> +	dev->fd = ret;
> +
> +	ret = read_and_check_sb(SB0_ADDR);
> +	if (ret) {
> +		ret = read_and_check_sb(SB1_ADDR);
> +		if (ret) {
> +			fprintf(stderr,
> +				"f2fslabel: Invalid f2fs superblock: %s\n",
> +				dev->path);
> +			exit(1);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void print_label(void)
> +{
> +	struct f2fs_super_block *sb = &sb_raw;
> +	char label[MAX_VOLUME_NAME];
> +
> +	if (open_sb(O_RDONLY))
> +		exit(1);
> +
> +	utf16_to_utf8(label, sb->volume_name, MAX_VOLUME_NAME, MAX_VOLUME_NAME);
> +	printf("%s\n", label);
> +}
> +
> +static void update_superblock(struct f2fs_super_block *sb, int sb_mask)
> +{
> +	int addr, ret;
> +	u_int8_t *buf;
> +
> +	buf = calloc(F2FS_BLKSIZE, 1);
> +	ASSERT(buf);
> +
> +	if (get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) {
> +		set_sb(crc, f2fs_cal_crc32(F2FS_SUPER_MAGIC, sb,
> +					   SB_CHKSUM_OFFSET));
> +	}
> +
> +	memcpy(buf + F2FS_SUPER_OFFSET, sb, sizeof(*sb));
> +	for (addr = SB0_ADDR; addr < SB_MAX_ADDR; addr++) {
> +		if (SB_MASK(addr) & sb_mask) {
> +			ret = dev_write_block(buf, addr);
> +			ASSERT(ret >= 0);
> +		}
> +	}
> +
> +	free(buf);
> +}

Ditto,

> +
> +static void change_label(char *label)
> +{
> +	struct f2fs_super_block *sb = &sb_raw;
> +	int len;
> +
> +	if (open_sb(O_RDWR))
> +		exit(1);
> +
> +	len = strlen(label);
> +	if (len > MAX_VOLUME_NAME) {
> +		fprintf(stderr,
> +			"f2fslabel: Label should be less than %d characters\n",
> +			MAX_VOLUME_NAME);
> +		exit(1);
> +	}
> +
> +	utf8_to_utf16(sb->volume_name, label, MAX_VOLUME_NAME, len);
> +
> +	update_superblock(sb, SB_MASK_ALL);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	if (argc < 2 || argc > 3) {
> +		fprintf(stderr, "Usage: f2fslabel device [newlabel]\n");
> +		exit(1);
> +	}
> +
> +	f2fs_init_configuration();
> +
> +	c.devices[0].path = argv[1];
> +
> +	if (argc == 2)
> +		print_label();
> +	else if (argc == 3)
> +		change_label(argv[2]);
> +
> +	return 0;
> +}

IMO, this can be integrated into fsck/main.c?

Thanks,

> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
