Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C062DD511
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 17:21:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpw2J-00081i-Bq; Thu, 17 Dec 2020 16:21:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kpw2H-00081b-TF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KMlzOHjwcuWbqparfPaUFZLMIuQ6BGlVQiY+bqZJ4f4=; b=ZYHYsFxhiLYlKQp0B/wCv0A/1v
 DBnlmbLxscHsYXnAs+XaLKqzASUbsW0HW6EDZuyZSF76r+3kPEPv2BqAgATie2CtVYZahchbU4TqH
 kToQm3wA5Bhw7F645KF2i7/E0A1lHgOs01ESqnGekKEr5w4jkEjmwDuV5YhrZe1fOU2s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KMlzOHjwcuWbqparfPaUFZLMIuQ6BGlVQiY+bqZJ4f4=; b=XQVXcRgDlxpbp+LGdd0Ws4TL/c
 m2Ds0ml9I1zELhgRiOyINPKutArcx/9o8kp02eTUR4nGfa7AlVLWW1OWCu+ss3A0QlqFp3a5TCwfL
 drF/NCnk0ku7lriiLYZAemA2PqUPX95XFVhD6HPCkkWcFRAasyYSflhlAXyQUIfWEQRM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpw2E-0007TF-ST
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:21:49 +0000
Date: Thu, 17 Dec 2020 08:21:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608222097;
 bh=jHzr6+tFBokdFu7JP5WAB8C/6k8tn3iaqv0lsRidiVk=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=M2HkOJpaOnSEp5spSBpK/58O+G3TfTuM0aGLIctJYTXH5AIfz1ejut0RmALO4PwCi
 4d6rCbjtYUde8f1K9rW4YyZ6TR07Qkyy5swR1IrDZFCM0OWoYzrT3eCm627GuiSnOU
 69nFtebron2g2J1G38ysi6nbxjoTSblLl+najA90Wa+Y6838MXSfJU7Z7rE18LVEtO
 kppkTgn1PxQwjzBHm6h4QS9+f//ns5xp9AbWVbqaXHHv633B9Iz2e7lNRZSoiwCFcx
 0HBKMnyzPAtqHB4b7/NO+KwcDdZjlxi2bv1u5pHyDP4o5R7ANBiopFCvehdAhXlczO
 BidevYwAb41qA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Robin Hsu <robinh3123@gmail.com>
Message-ID: <X9uFkOp0znVuqs/B@google.com>
References: <20201217161509.866105-1-robinh3123@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217161509.866105-1-robinh3123@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kpw2E-0007TF-ST
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: man page fix for sload
 compression
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Applied into the original patch. Thanks~

On 12/18, Robin Hsu wrote:
> From: Robin Hsu <robinhsu@google.com>
> 
> Fix man page for sload.f2fs compression support
> 
> Signed-off-by: Robin Hsu <robinhsu@google.com>
> ---
>  man/sload.f2fs.8 | 94 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 84 insertions(+), 10 deletions(-)
> 
> diff --git a/man/sload.f2fs.8 b/man/sload.f2fs.8
> index d07330c..c165b35 100644
> --- a/man/sload.f2fs.8
> +++ b/man/sload.f2fs.8
> @@ -7,22 +7,48 @@ sload.f2fs \- load directories and files into the device directly
>  .B sload.f2fs
>  [
>  .B \-f
> -.I source directory path
> +.I source-directory-path
>  ]
>  [
>  .B \-t
> -.I mount point
> +.I mount-point
>  ]
>  [
>  .B \-d
>  .I debugging-level
>  ]
> +[
> +.B \-c
> +[
> +.B \-L
> +.I log-of-blocks-per-cluster
> +]
> +[
> +.B \-a
> +.I compression-algorithm
> +]
> +[
> +.B \-x
> +.I file-extension-to-exclude-from-compression
> +|
> +.B \-i
> +.I file-extension-to-include-for-compression
> +]
> +[
> +.B \-m
> +.I minimum-compressed-blocks-per-cluster
> +]
> +[
> +.B \-r
> +]
> +]
>  .I device
>  .SH DESCRIPTION
>  .B sload.f2fs
> -is used to load directories and files into a disk partition.
> -\fIdevice\fP is the special file corresponding to the device (e.g.
> -\fI/dev/sdXX\fP).
> +is used to load directories and files into a disk partition, or an F2FS
> +image (file).
> +\fIdevice\fP could a special file corresponding to the device (e.g.
> +\fI/dev/sdXX\fP), or an F2FS image file.
>  
>  .PP
>  The exit code returned by
> @@ -30,24 +56,72 @@ The exit code returned by
>  is 0 on success and -1 on failure.
>  .SH OPTIONS
>  .TP
> -.BI \-f " source directory path"
> +.BI \-f " source-directory-path"
>  Specify the source directory path to be loaded.
>  .TP
> -.BI \-t " mount point path"
> +.BI \-t " mount-point-path"
>  Specify the mount point path in the partition to load.
>  .TP
>  .BI \-d " debug-level"
>  Specify the level of debugging options.
>  The default number is 0, which shows basic debugging messages.
>  .TP
> +.BI \-c
> +Enable a cluster-based file compression.
> +The file would be chopped into clusters, and each cluster is compressed
> +independently.
> +.TP
> +.BI \-L " log-of-blocks-per-cluster
> +Specify cluster size in power of two blocks.
> +The minimum value is 2 (4 blocks, default).
> +The maximum value is 8 (256 blocks).
> +Note that a block contains 4096 bytes.
> +This option must be used with option \fB\-c\fR.
> +.TP
> +.BI \-a " compression-algorithm"
> +Choose the algorithm for compression. Available options are:
> +lzo, lz4 (default).
> +This option must be used with option \fB\-c\fR.
> +.TP
> +.BI \-i " file-extension-to-include-for-compression"
> +Specify a file extension to include for the compression.
> +To specify multiple file extensions, use multiple option \fB\-i\fR's.
> +Files having one of the listed extensions will be compressed.
> +This option must be used with option \fB\-c\fR.
> +.TP
> +.BI \-x " file-extension-to-exclude-from-compression"
> +Specify a file extension to exclude from compression.
> +To specify multiple file extensions, use multiple option \fB\-x\fR's.
> +Files having one of the listed extensions won't be compressed.
> +This option must be used with option \fB\-c\fR.
> +.TP
> +.BI \-m " minimum-compressed-blocks-per-cluster"
> +Specify a minimum block count saved (by compression) per cluster.
> +The minimum value is 1 (default).
> +Maximum value is the cluster size in blocks minus 1.
> +If compression of a cluster fails to save at least the minimum compressed
> +block count given by the option, the cluster will not be compressed.
> +This option must be used with option \fB\-c\fR.
> +.TP
> +.BI \-r
> +Specify read-only flag for the compressed files.
> +It allows filesystem to release compressed space to the users, since, without
> +this option, filesystem should keep the space for future file updates.
> +This option must be used with option \fB\-c\fR.
> +
> +.SH NOTES
> +If neither \fB\-i\fR nor \fB\-x\fR is used, all files will be compressed.
> +Obviously, option \fB\-i\fR and \fB-x\fR can not be used together.
> +
>  .SH AUTHOR
>  This version of
>  .B sload.f2fs
> -has been written by Hou Pengyang <houpengyang@huawei.com>,
> -Liu Shuoran <liushuoran@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>
> +has been contributed by Hou Pengyang <houpengyang@huawei.com>,
> +Liu Shuoran <liushuoran@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
> +Robin Hsu <robinhsu@google.com>
>  .SH AVAILABILITY
>  .B sload.f2fs
> -is available from git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git.
> +is available from <git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git>.
>  .SH SEE ALSO
>  .BR mkfs.f2fs(8),
>  .BR fsck.f2fs(8),
> -- 
> 2.29.2.684.gfbc64c5ab5-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
