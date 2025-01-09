Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EF1A0749D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2025 12:27:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVqgt-0006Uz-DF;
	Thu, 09 Jan 2025 11:27:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qasdev00@gmail.com>) id 1tVqgs-0006Us-8s
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 11:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9eAda4W9uA5cE++I7CCfl9HPy3qcN5K2hzuEOSwc3VY=; b=XuZvHe2CaWrh4ZEG0CXyF+xupB
 rfcmtP7QQZ3sLOIv8jmv8RzVR8onS2wGfPXvMwpQGvt0PsG3dhb8d9LoVsjJbe+7npwQxpTbd2xVL
 7nFJzjbJgwm5QKPkOGjS6oGuDAfQYwDRLqdT2arpDhYz3sEONh+EjlFIXvNO4DC2RpIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Reply-To:Message-ID:Subject:Cc:To:From:Date:
 Sender:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9eAda4W9uA5cE++I7CCfl9HPy3qcN5K2hzuEOSwc3VY=; b=d
 XeOjUqIM8q8XcXoAe+vLBrpphLARRgZ363X3ydHlpialrsRczvnvFcMkJF0J9jR7iA8/9r9LmdPah
 U66DQ3FFS3wXWs4TFWGXwq9Ht1IM11wxuYkfo+V3dwfDJxFrDpVnH9++OPC7ozF1YU1PW9Uoo1+BL
 bstV67LNMqUk+CpU=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tVqgq-0005rb-Ub for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 11:27:05 +0000
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso668657f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jan 2025 03:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736422018; x=1737026818; darn=lists.sourceforge.net;
 h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9eAda4W9uA5cE++I7CCfl9HPy3qcN5K2hzuEOSwc3VY=;
 b=Ey0gB8hITFNMW2AtHGdBjM55mBHNerjR6iRm7aHSaOo08sJAzBnAgte/j62p6OC5el
 /QIxjl8z5wCQVpU03FQ8QclsFKLkhclyEPNov02bH2kNM99hHR+ls2cgHwPAWOqlJG5w
 /xMFI8pKrKKS77BU4A/SsyMVtS2qQrSy2vVL7dNDx+S5y3sNicoSUJwuDjJD982a38gp
 6DOH0JQh01diE5w1LYLFoKWrcMUThH+FfGz4LdF9sdoMXaXuIUDzx9++SUhAEu75Y2jf
 Sqor2Zsz+IIrpgdydv+kHYCICxetOWV9ih7TQptwGiGWkk9fgt/dBdZf6+U5klvu513s
 rP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736422018; x=1737026818;
 h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9eAda4W9uA5cE++I7CCfl9HPy3qcN5K2hzuEOSwc3VY=;
 b=XTy7fX/AJ6P2IDx1VPJ6vAdvvdeRnkndB+1e1PVRLqYumn+rj01DtkHSN5TeruvBcG
 ZV2TqqU3VXb2yCKjO+5J5FlB0K+fWmAW7TXnayjgAajEpKNvnfF86pjvd9Qjqv40p6Sx
 KmSKz/YgCINwhyVgee5+zIm5A6plKoOldi6u30fyGeeIwYayR21Ftjn7AMfcutOjvZIE
 xmTYo2mi1LkAj28Sy1cJ07RIL+oqkjhvUvujJbN/jXzD2lxkr6QYI2/Y681Cy/b9USXN
 ChTsWXz7J8i8hzRv91GYOAN9vMnNtPnH5AcQulgfBgi2D98eaX5IyNULbJZm7FwNxavd
 j46w==
X-Gm-Message-State: AOJu0YzVsyhNmdFlTIWYdONpPhSZR7mnx9k4pxmXHJFfzKCrBd/e/vPn
 +4bI08QTJ4xk1vbnCxemhsEG+43/pdFS+qe63y2kp4I06mnVJdOfNmBM6g==
X-Gm-Gg: ASbGnctgwpoUREmxYHen+kOKkhMaiLRNfxnkrQ+W+J92lhqBwcL6jwffJslrvWtnqwV
 QKQCG28Amt28tSJygNgMFU1X1brT2L5PnsoheAGEU1unWX2sYZnb2zBLlPejAS9Wn6ThvxQkV+W
 RAACxdS7iUrNRMzSBonszi1ONlIdLPss1w60EKgWQlXuPLvNFB+gHwQ1x8wVbGalJNaGRxO4EnW
 K7jv0tdvrbEu5DQNu3Ft81K3othY2Ob71qSB/c2dEwn0o17CfamnEHp7djU
X-Google-Smtp-Source: AGHT+IEIipjxaw0cGgvTADCEmk3PrGI5Nblz7EQ892CI6E1dqlG1uD6HCFQ8XMLZ+VvwHoEXEFgl7g==
X-Received: by 2002:a5d:5f82:0:b0:385:fa26:f0ac with SMTP id
 ffacd0b85a97d-38a872fc03fmr5762638f8f.7.1736422018064; 
 Thu, 09 Jan 2025 03:26:58 -0800 (PST)
Received: from qasdev.system ([2a02:c7c:6696:8300:d3fc:38ce:272d:9a1e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1cf2sm1556980f8f.99.2025.01.09.03.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 03:26:57 -0800 (PST)
Date: Thu, 9 Jan 2025 11:26:47 +0000
From: qasdev <qasdev00@gmail.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Z3-yd3LlQY_32kMe@qasdev.system>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 09, 2025 at 05:02:02PM +0800, Chao Yu wrote: >
 On 1/9/25 00:23, qasdev wrote: > > On Wed, Jan 08, 2025 at 07:44:03PM +0800,
 Chao Yu wrote: > > > Hi Qasim, > > > > > > On 2025/1/8 07:03, qa [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.221.42 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.221.42 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qasdev00[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qasdev00[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.42 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tVqgq-0005rb-Ub
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix slab-out-of-bounds Read KASAN bug
 in f2fs_getxattr()
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
Reply-To: 08098e46-0468-4fec-b2fb-9ea7414eaea0@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 09, 2025 at 05:02:02PM +0800, Chao Yu wrote:
> On 1/9/25 00:23, qasdev wrote:
> > On Wed, Jan 08, 2025 at 07:44:03PM +0800, Chao Yu wrote:
> > > Hi Qasim,
> > > 
> > > On 2025/1/8 07:03, qasdev wrote:
> > > > In f2fs_getxattr(), the function lookup_all_xattrs() allocates a 12-byte
> > > > (base_size) buffer for an inline extended attribute. However, when
> > > > __find_inline_xattr() calls __find_xattr(), it uses the macro
> > > > "list_for_each_xattr(entry, addr)", which starts by calling
> > > > XATTR_FIRST_ENTRY(addr). This skips a 24-byte struct f2fs_xattr_header
> > > > at the beginning of the buffer, causing an immediate out-of-bounds read
> > > > in a 12-byte allocation. The subsequent !IS_XATTR_LAST_ENTRY(entry)
> > > > check then dereferences memory outside the allocated region, triggering
> > > > the slab-out-of bounds read.
> > > > 
> > > > This patch prevents the out-of-bounds read by adding a check to bail
> > > > out early if inline_size is too small and does not account for the
> > > > header plus the 4-byte value that IS_XATTR_LAST_ENTRY reads.
> > > 
> > > Thank you very much for analyzing this issue, the root cause you figured out
> > > makes sense to me.
> > > 
> > > Can you please check the patch in below link? It seems it can fix this issue
> > > as well? IIUC.
> > > 
> > > https://lore.kernel.org/linux-f2fs-devel/20241216134600.8308-1-chao@kernel.org/
> > > 
> > > Thanks,
> > 
> > Hi Chao,
> > 
> > I tested the patch you linked on my machine and with syzbot, and both tests succeeded. The patch you linked works very well.
> 
> Hi Qasdev,
> 
> Thanks for the test!
> 
> > Here is the link to the results of the testing of both patches: https://syzkaller.appspot.com/bug?extid=f5e74075e096e757bdbf
> > 
> > Would it be possible to include me in the Tested-by header and any other contribution acknowledgments you feel appropriate?
> > > Thanks!
> > 
> > Best regards,
> > Qasim
> > 
> > > 
> > > > 
> > > > Reported-by: syzbot <syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com>
> > > > Closes: https://syzkaller.appspot.com/bug?extid=f5e74075e096e757bdbf
> > > > Tested-by: syzbot <syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com>
> > > > Tested-by: Qasim Ijaz <qasdev00@gmail.com>
> 
> IMO, it will be better to quoted your comment description and all above tags
> into the patch, what do you think?
> 
> Thanks,

Hi Chao,

Thank you for the suggestion. I agree that quoting my comment description and tags into the patch would provide helpful context.

Please feel free to include them as appropriate. Let me know if you need anything else from me.

Best regards,
Qasim

> 
> > > > Fixes: 388a2a0640e1 ("f2fs: remove redundant sanity check in sanity_check_inode()")
> > > > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > > > ---
> > > >    fs/f2fs/xattr.c | 3 +++
> > > >    1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> > > > index 3f3874943679..cf82646bca0e 100644
> > > > --- a/fs/f2fs/xattr.c
> > > > +++ b/fs/f2fs/xattr.c
> > > > @@ -329,6 +329,9 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
> > > >    	if (!xnid && !inline_size)
> > > >    		return -ENODATA;
> > > > +	if (inline_size < sizeof(struct f2fs_xattr_header) + sizeof(__u32))
> > > > +		return -ENODATA;
> > > > +
> > > >    	*base_size = XATTR_SIZE(inode) + XATTR_PADDING_SIZE;
> > > >    	txattr_addr = xattr_alloc(F2FS_I_SB(inode), *base_size, is_inline);
> > > >    	if (!txattr_addr)
> > > 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
