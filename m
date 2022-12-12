Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C17649E93
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 13:21:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4hoQ-0005mo-EA;
	Mon, 12 Dec 2022 12:21:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhuqiandann@gmail.com>) id 1p4hoP-0005mZ-E2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 12:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BcAXeIHfkMK9KXq9ftGmJ8WUeCsNRonPesUxZB6zPLw=; b=DsXgzuq8EoUtDgQnDYf3ztnqX8
 d3PuhmCTwtbb9JwfWvKzBf0SIlISoVsMhFiNG8dc/5fpRyidUNYrjiF8/ZhgkCm8b1+jl8FchT9+5
 4PBcKrV1yptSKD64XD3qDeBvgpjSOHYNZt9uzzosk5czaCQWF1/MSKFEY91r43grlIBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BcAXeIHfkMK9KXq9ftGmJ8WUeCsNRonPesUxZB6zPLw=; b=C+haL8NUfK5xj378RAQqyFc2e+
 zDtD+E2B0geCuVlqifQcb08PjX8z5Hs/TAXc/UkmzWdw40ummaq8D1deL82lgunNk91b5IQA4aMOf
 hsgN5R9N0BIAEW1sRRdb5vh16dSRtwSADOYSRJTGLj1+bTJiCPi61ju9TLoVrW1KYCnQ=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p4hoO-0002TO-8O for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 12:21:36 +0000
Received: by mail-pj1-f67.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so15499513pje.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Dec 2022 04:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BcAXeIHfkMK9KXq9ftGmJ8WUeCsNRonPesUxZB6zPLw=;
 b=q1os7l5fQQrL4oJv26hp6jcpO+N+CbETyzz+5akCRldnOkaXXxnRteRq1IZULQwt+c
 1POQqWJC8TkNILQ+n26MFX6SxRuFgfvpxSiQifOLk5hat+lJUjaIvLOofjEoU0Hob/zq
 ExRGFvbT+wJsST7Nv0eW4crBzmwgY/HryE3OrHf2zSnK1rnxN+bVh3LwKTlHrQrgmZDB
 QNqMalMf/ZgJuFA+GsjPm9gt1FIyaucdAjOQWYZFJBhjk/eqECnDBd/8cOpJqMbO93LY
 OOoGMo1qn1ElRhYh1yCVSY6SX8roC9jECzwGpvIeao6C3Eu2pBXJa4B9ILW+s5z9NWBd
 r18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BcAXeIHfkMK9KXq9ftGmJ8WUeCsNRonPesUxZB6zPLw=;
 b=IdwMOu57mrg1cf/yMxO+bZsAa2nuAWUqpz0GdEr+nBxvIu1NUmKsSxRX1YusNkmH+x
 QGAfmO+4imGMqisNrXlP117tYiIjuVG2I9i3PhzL+9F7gv3OIdEenYhvfKD8O6T1qils
 5huC1blDXx4ADrrtvS4ASup5HhsOGotICB9lFnMw0Vpz12QBA92gpy1E4jhCZHrv3vPk
 CIp07pbIqVTXvvfmvn3vIVtLVLI48hW5Mlhhz/KkYcSeUY/B4m4UArpB52vlowJasW3s
 8OoSZz+tWIXjtrmGCMB/gAMmcPcm4pF+oXIob7OQr7QeQU+RmgUfABeSnJEZFltxjzBW
 n4qw==
X-Gm-Message-State: ANoB5plm3VCMJr/ozTTAKQtcrYHhiUrKtQM8hO3ruAl6crUNUqL5OWjn
 iwf+as+6zOCwNIz/xsI1kVs=
X-Google-Smtp-Source: AA0mqf7kyIG8mVVfnKhyWnMxqTyfdu0OUZOEIX6skITpEGLG5oR1+P2LXCbqtxizE7PqzGQSKC32cA==
X-Received: by 2002:a17:902:8688:b0:189:89e0:4077 with SMTP id
 g8-20020a170902868800b0018989e04077mr16291429plo.55.1670847690686; 
 Mon, 12 Dec 2022 04:21:30 -0800 (PST)
Received: from mi-ThinkStation-K ([43.224.245.228])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170902714b00b001895b2d48a1sm6199469plm.253.2022.12.12.04.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:21:30 -0800 (PST)
Date: Mon, 12 Dec 2022 20:21:09 +0800
From: zhoudan <zhuqiandann@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20221212122109.GA714122@mi-ThinkStation-K>
References: <20221208050808.2448146-1-zhoudan8@xiaomi.com>
 <Y5OYYJYx9G2LbRmc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5OYYJYx9G2LbRmc@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Maybe I'm not describing it clearly enough, but I think there
 is something wrong with the logic here.The 'f2fs_release_compress_blocks'
 method does not determine if the file is compressed, but simply [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [zhuqiandann[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1p4hoO-0002TO-8O
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

Maybe I'm not describing it clearly enough, but I think there is 
something wrong with the logic here.The 'f2fs_release_compress_blocks'
method does not determine if the file is compressed, but simply adds 
the FI_COMPRESS_RELEASED flag. 
In particular, in the current Android system, when the application is 
installed, the release interface is called by default to release the 
storage marked as compressed,  without checking whether the file is 
actually compressed. In this case, when compress_mode is set to user, 
calling the compress interface returns ENVAL and the file cannot be 
compressed.
So I think the implementation of release needs to be modified, and 
only set FI_COMPRESS_RELEASED when it's really compressed and the 
storage is released.

On Fri, Dec 09, 2022 at 12:19:44PM -0800, Jaegeuk Kim wrote:
> On 12/08, zhoudan8 wrote:
> > In compress_mode=user, f2fs_release_compress_blocks()
> >  does not verify whether it has been compressed and
> >  sets FI_COMPRESS_RELEASED directly. which will lead to
> > return -EINVAL after calling compress.
> > To fix it,let's do not set FI_COMPRESS_RELEASED if file
> > is not compressed.
> 
> Do you mean you want to avoid EINVAL on a file having FI_COMPRESS_RELEASED
> with zero i_compr_blokcs?
> 
> I think the current logic is giving the error on a released file already.
> 
> > 
> > Signed-off-by: zhoudan8 <zhoudan8@xiaomi.com>
> > ---
> >  fs/f2fs/file.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 82cda1258227..f32910077df6 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -3451,14 +3451,13 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
> >  	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
> >  	if (ret)
> >  		goto out;
> > -
> > -	set_inode_flag(inode, FI_COMPRESS_RELEASED);
> >  	inode->i_ctime = current_time(inode);
> >  	f2fs_mark_inode_dirty_sync(inode, true);
> >  
> >  	if (!atomic_read(&F2FS_I(inode)->i_compr_blocks))
> >  		goto out;
> >  
> > +	set_inode_flag(inode, FI_COMPRESS_RELEASED);
> >  	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> >  	filemap_invalidate_lock(inode->i_mapping);
> >  
> > -- 
> > 2.38.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
