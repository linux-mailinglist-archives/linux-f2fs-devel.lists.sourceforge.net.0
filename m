Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5C71C7302
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 16:39:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWLDG-0002VC-ST; Wed, 06 May 2020 14:39:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jWLDF-0002V4-IB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 14:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MUYnGuIkDHpNd0Wath5rg148Ner5oUZ42h012zDKtWM=; b=hen6qdgttHGY6A8N83MZTeD3UL
 EnaEglvBnVz53UeJ0RDNzDW7A1N3Qoyj4ESJC/ZWB1mCU95ZCBpA7xAHrvST9uOPCgWlF6qD2UQ35
 +mrHU33XjB6fCf3Iiwh8hfowlxeXETGskQcDiHOxIydIa4dRM+FWoeNQXDRk2OyGCiHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MUYnGuIkDHpNd0Wath5rg148Ner5oUZ42h012zDKtWM=; b=a15pI6ASq/fvDtov5U8fuGvT0Y
 1X7+kutXp/UzeGP76JVpodL/s1UkxplQ43RyyH3uheioJlOM+a4uSRWS72qFhj9OSxQiii8bQLKO1
 6kss5XnYQ/bVrZFeaBRt+ayHW4HwZfN+aiiFNiuewELDINLWfzf2c2V0qF+SpkS1eZR0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWLDD-00Cygk-Kc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 14:39:53 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F378F20836;
 Wed,  6 May 2020 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588775986;
 bh=00NCqV3s7AJ76+/S2VCAXmsuFQ+L+Y8sue8TCPa+yKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z67GinlxMw2MITs4E40InAj7jBrcx65adTSB88vEB2HfiZIyixDy9eyX2IhBewabr
 BJ43HbN5FWiUx+oTv92CrSAa8Y35BmH8gQ9jv8+NhJVMBJUnMcQsr1w0uG1reygiRU
 p2CbayD+XgCtIP59LdlkuGY+doPuFD1YEk+xrsAk=
Date: Wed, 6 May 2020 07:39:45 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200506143945.GA107238@google.com>
References: <20200502002920.76569-1-jaegeuk@kernel.org>
 <66e59a2f-c877-6952-cae6-645ba18f9f75@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66e59a2f-c877-6952-cae6-645ba18f9f75@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWLDD-00Cygk-Kc
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs_io: add fsync
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

On 05/06, Chao Yu wrote:
> On 2020/5/2 8:29, Jaegeuk Kim wrote:
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  tools/f2fs_io/f2fs_io.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> > index c1edef1..c84b6ab 100644
> > --- a/tools/f2fs_io/f2fs_io.c
> > +++ b/tools/f2fs_io/f2fs_io.c
> > @@ -130,6 +130,30 @@ static void full_write(int fd, const void *buf, size_t count)
> >  	}
> >  }
> >  
> > +#define fsync_desc "fsync"
> > +#define fsync_help						\
> > +"f2fs_io fsync [file]\n\n"					\
> 
> What about supporting fdatasync via an additional argument here?

I prefer to add another command "fdatasync" for simplicity. :P

> 
> > +"fsync given the file\n"					\
> > +
> > +static void do_fsync(int argc, char **argv, const struct cmd_desc *cmd)
> > +{
> > +	int fd;
> > +
> > +	if (argc != 2) {
> > +		fputs("Excess arguments\n\n", stderr);
> > +		fputs(cmd->cmd_help, stderr);
> > +		exit(1);
> > +	}
> > +
> > +	fd = xopen(argv[1], O_WRONLY, 0);
> > +
> > +	if (fsync(fd) != 0)
> > +		die_errno("fsync failed");
> > +
> > +	printf("fsync a file\n");
> > +	exit(0);
> > +}
> > +
> >  #define set_verity_desc "Set fs-verity"
> >  #define set_verity_help					\
> >  "f2fs_io set_verity [file]\n\n"				\
> > @@ -780,6 +804,7 @@ static void do_reserve_cblocks(int argc, char **argv, const struct cmd_desc *cmd
> >  static void do_help(int argc, char **argv, const struct cmd_desc *cmd);
> >  const struct cmd_desc cmd_list[] = {
> >  	_CMD(help),
> > +	CMD(fsync),
> >  	CMD(set_verity),
> >  	CMD(getflags),
> >  	CMD(setflags),
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
