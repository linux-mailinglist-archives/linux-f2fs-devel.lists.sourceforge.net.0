Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C898F8CF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 04:23:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyRtr-00022A-Ta; Fri, 16 Aug 2019 02:23:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hyRtp-000222-UQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 02:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chMVtC+I2XUXlipqG+CxKzYpekXVzf4ewR2flVvZXXg=; b=A1mQdRr9rIBT+rYqQE0Qwz+id5
 Hwxu6bo15gXx14jM1mxlMzA1nLHo0vBBlM5ifuo0vO10D70G9y/TldVuzw2CckU1IBRfhemJ3WBCQ
 jMC5Kcm9/YLhgiVQLuVhJw4MVTvgcDDfqBAMITt2JTE8EH6O9XMht5KLhBnmnUXwGZsU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=chMVtC+I2XUXlipqG+CxKzYpekXVzf4ewR2flVvZXXg=; b=OgpFxo+NuEBGX3HDnnkWgPPDO9
 oFaZ7H6oy+MlInWOZ89iuxTmwSORhFNfI7NBfIbSah/tK8DeZf5buhZecvm9sky4gQzAusOYGH3zN
 QXDc8h2O0hvV1hPWJbR8v2OcNjYaLtghUc967vjnlUC6kPwwb3mvPF4lsTkcf1O0pg8k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyRtd-005OrC-HC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 02:23:29 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5F57206C1;
 Fri, 16 Aug 2019 02:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565922191;
 bh=rWrscXB0E05M6T6Ws3jrLZOxIcUe33eY//b/UCQpxPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AUWd4T5hPCoA8KFyOHQIkfcflI6CqAlC0NW5rUKaEyMYEjiY43xcH5JFGdAGIi9fw
 jgFETcJNXVaNfygvoroMykRzdjpfMFZ1z7JoA3J1evDPUSiZvf371kxSPrMslkqUmJ
 vE5PbgKhJeLhKGDRJQ+84aOqbtbNfuChPCC5JWdg=
Date: Thu, 15 Aug 2019 19:23:11 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190816022311.GA73510@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190809152328.94814-1-jaegeuk@kernel.org>
 <0177358e-f900-857d-d7e6-5e5335497913@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0177358e-f900-857d-d7e6-5e5335497913@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hyRtd-005OrC-HC
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: add get/setflags
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
Cc: Jaegeuk Kim <jaegeuk@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/12, Chao Yu wrote:
> On 2019/8/9 23:23, Jaegeuk Kim wrote:
> > From: Jaegeuk Kim <jaegeuk@google.com>
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
> > ---
> >  tools/f2fs_io/f2fs_io.c | 91 +++++++++++++++++++++++++++++++++++++++++
> >  tools/f2fs_io/f2fs_io.h | 14 +++++++
> >  2 files changed, 105 insertions(+)
> > 
> > diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> > index 6b43778..b57c458 100644
> > --- a/tools/f2fs_io/f2fs_io.c
> > +++ b/tools/f2fs_io/f2fs_io.c
> > @@ -45,6 +45,95 @@ struct cmd_desc {
> >  	int cmd_flags;
> >  };
> >  
> > +#define getflags_desc "getflags ioctl"
> > +#define getflags_help						\
> > +"f2fs_io getflags [file]\n\n"					\
> > +"get a flag given the file\n"					\
> > +"flag can show \n"						\
> > +"  casefold\n"							\
> > +"  compression\n"						\
> > +"  nocompression\n"
> 
> Could we support +/- flags?
> 
> > +
> > +static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
> > +{
> > +	long flag;
> > +	int ret, fd;
> > +	int exist = 0;
> > +
> > +	if (argc != 2) {
> > +		fputs("Excess arguments\n\n", stderr);
> > +		fputs(cmd->cmd_help, stderr);
> > +		exit(1);
> > +	}
> > +
> > +	fd = open(argv[1], O_RDONLY);
> > +	if (fd == -1) {
> > +		fputs("Open failed\n\n", stderr);
> > +		fputs(cmd->cmd_help, stderr);
> > +		exit(1);
> > +	}
> > +	ret = ioctl(fd, F2FS_IOC_GETFLAGS, &flag);
> > +	printf("get a flag on %s ret=%d, flags=", argv[1], ret);
> > +	if (flag & FS_CASEFOLD_FL) {
> > +		printf("casefold");
> > +		exist = 1;
> > +	}
> > +	if (flag & FS_COMPR_FL) {
> > +		if (exist)
> > +			printf(",");
> > +		printf("compression");
> > +		exist = 1;
> > +	}
> > +	if (flag & FS_NOCOMP_FL) {
> > +		if (exist)
> > +			printf(",");
> > +		printf("nocompression");
> > +		exist = 1;
> > +	}
> > +	if (!exist)
> > +		printf("none");
> > +	printf("\n");
> > +	exit(0);
> > +}
> > +
> > +#define setflags_desc "setflags ioctl"
> > +#define setflags_help						\
> > +"f2fs_io setflags [flag] [file]\n\n"				\
> > +"set a flag given the file\n"					\
> > +"flag can be\n"							\
> > +"  casefold\n"							\
> > +"  compression\n"						\
> > +"  nocompression\n"
> > +
> > +static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
> > +{
> > +	long flag;
> > +	int ret, fd;
> > +
> > +	if (argc != 3) {
> > +		fputs("Excess arguments\n\n", stderr);
> > +		fputs(cmd->cmd_help, stderr);
> > +		exit(1);
> > +	}
> > +
> > +	fd = open(argv[2], O_RDONLY);
> > +	if (fd == -1) {
> > +		fputs("Open failed\n\n", stderr);
> > +		fputs(cmd->cmd_help, stderr);
> > +		exit(1);
> > +	}
> > +	if (!strcmp(argv[1], "casefold"))
> > +		flag = FS_CASEFOLD_FL;
> > +	else if (!strcmp(argv[1], "compression"))
> > +		flag = FS_COMPR_FL;
> > +	else if (!strcmp(argv[1], "nocompression"))
> > +		flag = FS_NOCOMP_FL;
> > +
> > +	ret = ioctl(fd, F2FS_IOC_SETFLAGS, &flag);
> 
> It will drop other existed flags, should be:

Is it correct?

In f2fs_setflags_common,

	fi->i_flags = iflags | (fi->i_flags & ~mask);


> 
> F2FS_IOC_GETFLAGS flag
> flag +/- FS_*_FL
> F2FS_IOC_SETFLAGS flag
> 
> Thanks,
> 
> > +	printf("set a flag: %s ret=%d\n", argv[2], ret);
> > +	exit(0);
> > +}
> > +
> >  #define shutdown_desc "shutdown filesystem"
> >  #define shutdown_help					\
> >  "f2fs_io shutdown [level] [dir]\n\n"			\
> > @@ -488,6 +577,8 @@ static void do_defrag_file(int argc, char **argv, const struct cmd_desc *cmd)
> >  static void do_help(int argc, char **argv, const struct cmd_desc *cmd);
> >  const struct cmd_desc cmd_list[] = {
> >  	_CMD(help),
> > +	CMD(getflags),
> > +	CMD(setflags),
> >  	CMD(shutdown),
> >  	CMD(pinfile),
> >  	CMD(fallocate),
> > diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
> > index 95fd5be..5768c1b 100644
> > --- a/tools/f2fs_io/f2fs_io.h
> > +++ b/tools/f2fs_io/f2fs_io.h
> > @@ -41,9 +41,13 @@ typedef u32	__be32;
> >  #ifndef FS_IOC_GETFLAGS
> >  #define FS_IOC_GETFLAGS			_IOR('f', 1, long)
> >  #endif
> > +#ifndef FS_IOC_SETFLAGS
> > +#define FS_IOC_SETFLAGS			_IOW('f', 2, long)
> > +#endif
> >  
> >  #define F2FS_IOCTL_MAGIC		0xf5
> >  #define F2FS_IOC_GETFLAGS		FS_IOC_GETFLAGS
> > +#define F2FS_IOC_SETFLAGS		FS_IOC_SETFLAGS
> >  
> >  #define F2FS_IOC_START_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 1)
> >  #define F2FS_IOC_COMMIT_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 2)
> > @@ -98,6 +102,16 @@ typedef u32	__be32;
> >  #define F2FS_IOC_FSGETXATTR		FS_IOC_FSGETXATTR
> >  #define F2FS_IOC_FSSETXATTR		FS_IOC_FSSETXATTR
> >  
> > +#ifndef FS_NOCOMP_FL
> > +#define FS_NOCOMP_FL			0x00000400 /* Don't compress */
> > +#endif
> > +#ifndef FS_COMPR_FL
> > +#define FS_COMPR_FL			0x00000004 /* Compress file */
> > +#endif
> > +#ifndef FS_CASEFOLD_FL
> > +#define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
> > +#endif
> > +
> >  struct f2fs_gc_range {
> >  	u32 sync;
> >  	u64 start;
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
