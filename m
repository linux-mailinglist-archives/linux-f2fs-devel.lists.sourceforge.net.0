Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A21A64AD90
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 03:21:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4uvH-0006ZS-F7;
	Tue, 13 Dec 2022 02:21:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhuqiandann@gmail.com>) id 1p4uvG-0006ZM-6e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 02:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3GJvqoej8HYxTnxfSuAPi6hTjb1Vgz1dmuhQAIbX9nU=; b=Pk8dEgDC6oI3Nho+wHFhssQ1Zr
 eGeHdnZTZz/wNeKmoKTNlrfi2K+EoYyhPfa++pg3kDrZ41B++b0GKknHoVCFOBYyyTbu9/0AoC47V
 fK7iI2i8I4L0noZrE6oP1d5bfpazSL0GP853Ib/0RJDdjJBGMaHfdf2mKb+9jMM1KrGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3GJvqoej8HYxTnxfSuAPi6hTjb1Vgz1dmuhQAIbX9nU=; b=iNQB6GJ4eSO6AA/eHaC0RTP/df
 8V58LNFL2KfmnHSvGdcgfwruflMLEPvYAHWG9kkMF5aBvcQH1m+Uet3ks9yWMFGDAPdbt7zlw2cx7
 0/e9v/utTACIEzZBP/XKiic2szaS5Dt3g6ep2Bw6RayQSWyAYMrJmpX/Ez2gvHEZv/Ms=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p4uvC-00FJl5-16 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 02:21:34 +0000
Received: by mail-pl1-f195.google.com with SMTP id g10so14078744plo.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Dec 2022 18:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3GJvqoej8HYxTnxfSuAPi6hTjb1Vgz1dmuhQAIbX9nU=;
 b=pXvyZqmR+fhVi20IlDjOV2Q3MEsWPbOYS18DKR68vMzvEyspd/XpHRmI/p1Btap2Sf
 DsMe9t/H17Ep5HryqMpJKZ7L9ePm7SZ8p5DlmofWc3Qjf3CXS6vz4HPMBaILiTMvjJGx
 4d4fweQDMPY0sOQrLpW5WzVryzaZwMA/Je7SvBjADzephzI0lEKJBMCUc918sgHl0thX
 y7RAW8K+GNt20urQd/bFPp8vBnjWWbjGRfCOkv1Pd9Ahtv7YkaLJj4ylei/7geg0ZLH9
 +AYOQOI5qWsMam9mWSnMHNe6uPvwja47a8nT0EJeGA4BCX+S0wjEVfkixeOVTsihUxQn
 XvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GJvqoej8HYxTnxfSuAPi6hTjb1Vgz1dmuhQAIbX9nU=;
 b=1bpE2JCO17hB9hA2VdpsDlB2SuDuKG8KyBjrZdPYa2mc4DgKF+nd5E7Tt8CklAOZdt
 znLXrHKdDOEyIVdwNvW4E1vE2bbxP/0RDnJ6BA738kThCCpfcJltH6NRodgXN3jI2QBq
 bH1+XNPd3t4ItmT93tAy1QhF+uOoTPHh0iwRsU6tGnfrGE4US4wBu9P0btQkF+jbfb50
 TQngB6DKQwCNFu5JtJMZD0EC0P/Sg+on5h7vcLlh0TfnM3waeg5PVUFR1+fV5pO5NRBg
 qDEZ860WdZtP0mrnPEoekcAad2TptHlsnUqQEbxsnABvIjFXj3BDJdPPQS5nFLTBrYcY
 2iaw==
X-Gm-Message-State: ANoB5pnACTiLK06ZPiord36uU86yIIOTpX21RYY1AoQlQUs6Rif/WB3a
 1ad9oESaAWxwf2Fm/hP8SZE=
X-Google-Smtp-Source: AA0mqf777PQQ8zccjWAtTOaxYZB+2AHCAP7D4AyTJhtpBojKU57ansA0CiKHHn5CJNaxclSljVe/9Q==
X-Received: by 2002:a05:6a20:699b:b0:9d:efbe:2078 with SMTP id
 t27-20020a056a20699b00b0009defbe2078mr30988576pzk.46.1670898084417; 
 Mon, 12 Dec 2022 18:21:24 -0800 (PST)
Received: from mi-ThinkStation-K ([43.224.245.228])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a63dc44000000b004786c63c21esm5795430pgj.42.2022.12.12.18.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 18:21:23 -0800 (PST)
Date: Tue, 13 Dec 2022 10:21:00 +0800
From: zhoudan <zhuqiandann@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20221213022100.GA841758@mi-ThinkStation-K>
References: <20221208050808.2448146-1-zhoudan8@xiaomi.com>
 <Y5OYYJYx9G2LbRmc@google.com>
 <20221212122109.GA714122@mi-ThinkStation-K>
 <Y5ezpOwd8sOTTaW5@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5ezpOwd8sOTTaW5@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  However, 'f2fs_compressed_file()' only determines whether
 the file can be compressed, not whether the file has been compressed. As far
 as I know, when compress_mode is user, files marked FI_COMPRESSED [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [zhuqiandann[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1p4uvC-00FJl5-16
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't set FI_COMPRESS_RELEASED if file
 is not compressed
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
Cc: zhoudan8@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

However, 'f2fs_compressed_file()' only determines whether the file can 
be compressed, not whether the file has been compressed. As far as I 
know, when compress_mode is user, files marked FI_COMPRESSED_FILE 
will be compressed only after 'f2fs_ioc_compress_file()' is called.
On Mon, Dec 12, 2022 at 03:05:08PM -0800, Jaegeuk Kim wrote:
> On 12/12, zhoudan wrote:
> > Maybe I'm not describing it clearly enough, but I think there is 
> > something wrong with the logic here.The 'f2fs_release_compress_blocks'
> > method does not determine if the file is compressed, but simply adds 
> > the FI_COMPRESS_RELEASED flag. 
> 
> I firstly lost your point since f2fs_release_compress_blocks() checked
> f2fs_compressed_file().
> 
> > In particular, in the current Android system, when the application is 
> > installed, the release interface is called by default to release the 
> > storage marked as compressed,  without checking whether the file is 
> > actually compressed. In this case, when compress_mode is set to user, 
> > calling the compress interface returns ENVAL and the file cannot be 
> > compressed.
> > So I think the implementation of release needs to be modified, and 
> > only set FI_COMPRESS_RELEASED when it's really compressed and the 
> > storage is released.
> > 
> > On Fri, Dec 09, 2022 at 12:19:44PM -0800, Jaegeuk Kim wrote:
> > > On 12/08, zhoudan8 wrote:
> > > > In compress_mode=user, f2fs_release_compress_blocks()
> > > >  does not verify whether it has been compressed and
> > > >  sets FI_COMPRESS_RELEASED directly. which will lead to
> > > > return -EINVAL after calling compress.
> > > > To fix it,let's do not set FI_COMPRESS_RELEASED if file
> > > > is not compressed.
> > > 
> > > Do you mean you want to avoid EINVAL on a file having FI_COMPRESS_RELEASED
> > > with zero i_compr_blokcs?
> > > 
> > > I think the current logic is giving the error on a released file already.
> > > 
> > > > 
> > > > Signed-off-by: zhoudan8 <zhoudan8@xiaomi.com>
> > > > ---
> > > >  fs/f2fs/file.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > index 82cda1258227..f32910077df6 100644
> > > > --- a/fs/f2fs/file.c
> > > > +++ b/fs/f2fs/file.c
> > > > @@ -3451,14 +3451,13 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
> > > >  	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
> > > >  	if (ret)
> > > >  		goto out;
> > > > -
> > > > -	set_inode_flag(inode, FI_COMPRESS_RELEASED);
> > > >  	inode->i_ctime = current_time(inode);
> > > >  	f2fs_mark_inode_dirty_sync(inode, true);
> > > >  
> > > >  	if (!atomic_read(&F2FS_I(inode)->i_compr_blocks))
> > > >  		goto out;
> > > >  
> > > > +	set_inode_flag(inode, FI_COMPRESS_RELEASED);
> > > >  	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> > > >  	filemap_invalidate_lock(inode->i_mapping);
> > > >  
> > > > -- 
> > > > 2.38.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
