Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8172E82928
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 03:26:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huoF2-0008Lp-2N; Tue, 06 Aug 2019 01:26:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1huoEz-0008Lf-JA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 01:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ORLkKORHQS3k7q10UaIzmFI4p54TDmVUVhNQXjMelo=; b=G1vC68dN7OQCUkhyDgIWdrcloD
 LrMVRZmzTnGykVFMU0BzkwG4iOM9jdeBBnhUtAP4sqjB20z+JCGdPAFaPHn9obRSZEArEuZxcFuFk
 oYbs5iZSz8KOemvIw8dVAk61QmslZrTpEbfL4vIxVEOZIyWbAr28O0b9JtdvzbhxASIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ORLkKORHQS3k7q10UaIzmFI4p54TDmVUVhNQXjMelo=; b=iJBpdkb2FsKFet1kZtAizFZCNq
 WyvJQmHIzPTxrYB6VSw3B5+wQVsWckSEXUVfaWr3jQjKTRlka6TOtTipYvvpYn/c2+dsXH8X+L9t6
 4sfEOXo06QPV5LmbFa/Vcgo5t7uzOQBIfiDkyz8+qSBC3KN4NhoUL7VZNTb7QlH+lJXA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huoEx-00CLEA-0V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 01:26:16 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 671F42147A;
 Tue,  6 Aug 2019 01:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565054769;
 bh=2r2dojN0+obCTkqJmHix8I/F/giOsUnKxOU30/+g64k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1Vm4ii7iX4yWh7Ufx4lKDprk4q0lghqC8OoCefKiJHsVl+NGHUdGMI/kCDbwNNqsc
 COkrVZJtgYRv2o8ywlkcQVR+nqimzOsZOOuLPBaAmhTdII2MxexQYASSD5DL1qm14C
 c2zFGLpfmrc+v9JnX+InHM5apYVzYcVh8uEWecm0=
Date: Mon, 5 Aug 2019 18:26:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190806012608.GC1029@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190727154434.5946-1-chao@kernel.org>
 <b3010d4f-11c8-58e8-96fe-578d58278e28@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3010d4f-11c8-58e8-96fe-578d58278e28@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1huoEx-00CLEA-0V
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: support defrag_file
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/06, Chao Yu wrote:
> On 2019/7/27 23:44, Chao Yu wrote:
> > From: Chao Yu <yuchao0@huawei.com>
> > 
> > Support 'defrag_file' sub command to trigger file based defragment via
> > ioctl in f2fs.
> > 
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> > v2:
> > - remove unneeded debug info.
> > - fix compile warning.
> 
> Sorry I sent the old one...
> 
> I add -v option, but w/o implement the details, because I just see generic/018
> want this, also other filesystem utils have this option, not sure we should
> remove this option... any thoughts?

Ah, we don't need this option.

> 
> "f2fs_io defrag_file [start] [length] [-v] [file_path]\n\n"	
> 
> >  tools/f2fs_io/f2fs_io.c | 41 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> > 
> > diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> > index f087da4..59ef8a7 100644
> > --- a/tools/f2fs_io/f2fs_io.c
> > +++ b/tools/f2fs_io/f2fs_io.c
> > @@ -442,6 +442,46 @@ static void do_gc_urgent(int argc, char **argv, const struct cmd_desc *cmd)
> >  	}
> >  }
> >  
> > +#define defrag_file_desc "do defragment on file"
> > +#define defrag_file_help						\
> > +"f2fs_io defrag_file [start] [length] [-v] [file_path]\n\n"		\
> > +"  start     : start offset of defragment region, unit: bytes\n"	\
> > +"  length    : bytes number of defragment region\n"			\
> > +"  -v        : be verbose\n"						\
> > +
> > +static void do_defrag_file(int argc, char **argv, const struct cmd_desc *cmd)
> > +{
> > +	struct f2fs_defragment df;
> > +	u64 len;
> > +	int ret, fd;
> > +
> > +	if (argc != 5) {
> > +		fputs("Excess arguments\n\n", stderr);
> > +		fputs(cmd->cmd_help, stderr);
> > +		exit(1);
> > +	}
> > +
> > +	df.start = atoll(argv[1]);
> > +	df.len = len = atoll(argv[2]);
> > +
> > +	fd = open(argv[4], O_RDWR);
> > +	if (fd == -1) {
> > +		fputs("Open failed\n\n", stderr);
> > +		fputs(cmd->cmd_help, stderr);
> > +		exit(1);
> > +	}
> > +printf("%lu, %lu\n", df.start, df.len);
> > +	ret = ioctl(fd, F2FS_IOC_DEFRAGMENT, &df);
> > +	if (ret < 0) {
> > +		perror("F2FS_IOC_DEFRAGMENT");
> > +		exit(1);
> > +	}
> > +	printf("defrag %s in region[%lu, %lu]\n", argv[3],
> > +				df.start, df.start + len);
> > +	exit(0);
> > +}
> > +
> > +
> >  #define CMD_HIDDEN 	0x0001
> >  #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
> >  #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
> > @@ -456,6 +496,7 @@ const struct cmd_desc cmd_list[] = {
> >  	CMD(read),
> >  	CMD(fiemap),
> >  	CMD(gc_urgent),
> > +	CMD(defrag_file),
> >  	{ NULL, NULL, NULL, NULL, 0 }
> >  };
> >  
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
