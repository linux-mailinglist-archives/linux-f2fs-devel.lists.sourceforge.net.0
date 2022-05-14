Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8574C527103
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 14:14:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npqfa-0003TL-C8; Sat, 14 May 2022 12:14:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bagasdotme@gmail.com>) id 1npqfY-0003T6-8n
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 12:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1aSGY0h+9mFG07V/uGzLZko6mgSx1gaXsXLrsGCI9XA=; b=Tqy3+DZiK4Sl/+Ueknbf+u6jbh
 ZxQTBjYY97M/3ePJrXaaXUzWOWHzkBr0e/Fbs98yAZqK5ASj61ZIfSagw4Q5q5VDvuIWl5YqERVHz
 LBAoo0DT7A7y169ZBNBq4PdnKIECcKh0bvRtBIQJtonWlZhtZ3+gyRGNrvW/pzbaEO8A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1aSGY0h+9mFG07V/uGzLZko6mgSx1gaXsXLrsGCI9XA=; b=Z3dBT6fKcEBFokIRR9ktxhLrR3
 Ae7MP6E4f8JpYGZ8oWIbSh7OnGq5r74ZF7jwUyh3o4Dc9MkOGZ0q8x7GR5h9NWgKcOceQ6+0heCXs
 9yz3YODHbmyeYg7zsVQg+NIEruBOQMzWZIlBSNmCqAOspiDXm0GgSltAuSTfHRk8crYs=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1npqfX-0006bx-V3
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 12:14:48 +0000
Received: by mail-pg1-f182.google.com with SMTP id 31so9851133pgp.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 May 2022 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1aSGY0h+9mFG07V/uGzLZko6mgSx1gaXsXLrsGCI9XA=;
 b=N7Hmhn5Lg9cczfQn3yUsdZ/KhteBfYV4DxaXQX1ynP/EGQpy1xkmF+CaY3zyG4wE7z
 cJ5wLDs/g7UBXXQkfGMJ8cdc+nIeq5VDRakjMfmf4n4SP4dSmd5SG8w9C6VtIo06SwSf
 4lEgvYhUn3Zd4IMaaO8OgKlt3xGvuIJkWg7lotceD53JQnQjtDMtC5wdVR7iNgs+Vmj7
 1lKDKT31aU+zjUBFGCHqZED2HctANq+UrVqRDEYt3qJgS0SBtQZ0+i/4c/jOKHdw9+Fw
 Rzu9HiEH2oBuEkMwL3WMSWQmXUDqwrx8bWn9srrM994bF3ygOWrd0SMSe97JYeFOpqBZ
 7vKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1aSGY0h+9mFG07V/uGzLZko6mgSx1gaXsXLrsGCI9XA=;
 b=sAj3mlcX/Zy5CDASvXpbAdv5HzU9bTDGTKQVMJK9OK8TwjdwHhhfQuuALdvAWNhP2V
 Kitu/vP7ncCEmAhCU9VTYPWQc9ZD2A07sFrLPcVYitTzJtUGEiHbzzrDWMNgY8+UT02v
 Xzr34k9red+PVHeTqe7jvVPiSgsOrIwwikp3Lt7tejDZxEUL4Iw4Sfljc9TAnPwFGJ5s
 3DQ5s2c9hB0PW1aHYfeje2TuR3biR980KAxbwiaWUSBvUdxlnCX+I+emqtZi1+r6zLa+
 I5m8zA6isW9brsnk/ZsxPVzUh1+9PherFPD/nY6fmPn0zaQBOBYuwbqjGz5nVC38/W68
 u0Vw==
X-Gm-Message-State: AOAM531oY7+oWDeiIAinEDAx+sXiiTc+tdB7CpaQzT7aHUA4oIYXx9Yf
 DHL+HX0OMp9TVmMOvJq5kHU=
X-Google-Smtp-Source: ABdhPJyvXfa3aO808JTEoNWi/aJttupdVwqAH0ymCcC/qYyTZhZFgrfYarrbc+e6gIxYXNXz2KeiyQ==
X-Received: by 2002:a63:1e1d:0:b0:3c6:a36f:7b13 with SMTP id
 e29-20020a631e1d000000b003c6a36f7b13mr7785413pge.447.1652530482317; 
 Sat, 14 May 2022 05:14:42 -0700 (PDT)
Received: from localhost (subs09a-223-255-225-65.three.co.id. [223.255.225.65])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a62b618000000b0050dc76281b1sm3430254pff.139.2022.05.14.05.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 05:14:41 -0700 (PDT)
Date: Sat, 14 May 2022 19:14:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yn+dLtxsy6LwVIBQ@debian.me>
References: <20220514080102.2246-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220514080102.2246-1-chao@kernel.org>
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, May 14, 2022 at 04:01:02PM +0800, Chao Yu wrote: >
 As Yanming reported in bugzilla: > >
 https://bugzilla.kernel.org/show_bug.cgi?id=215895
 > > I have encountered a bug in F2FS file system in k [...] 
 Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bagasdotme[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.182 listed in list.dnswl.org]
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [223.255.225.65 listed in dnsbl.sorbs.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1npqfX-0006bx-V3
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to do sanity check for inline
 inode
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Ming Yan <yanming@tju.edu.cn>,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, May 14, 2022 at 04:01:02PM +0800, Chao Yu wrote:
> As Yanming reported in bugzilla:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215895
> 
> I have encountered a bug in F2FS file system in kernel v5.17.
> 
> The kernel message is shown below:
> 
> kernel BUG at fs/inode.c:611!
> Call Trace:
>  evict+0x282/0x4e0
>  __dentry_kill+0x2b2/0x4d0
>  dput+0x2dd/0x720
>  do_renameat2+0x596/0x970
>  __x64_sys_rename+0x78/0x90
>  do_syscall_64+0x3b/0x90
> 
> The root cause is: fuzzed inode has both inline_data flag and encrypted
> flag, so after it was deleted by rename(), during f2fs_evict_inode(),
> it will cause inline data conversion due to flags confilction, then
> page cache will be polluted and trigger panic in clear_inode().
> 
> This patch tries to fix the issue by do more sanity checks for inline
> data inode in sanity_check_inode().
> 
> Cc: stable@vger.kernel.org
> Reported-by: Ming Yan <yanming@tju.edu.cn>
> Signed-off-by: Chao Yu <chao.yu@oppo.com>

Hi Chao,

I think the patch message can be reworked , like below:

Yanming reported a kernel bug in Bugzilla kernel, which can be reproduced.
The bug message is:

kernel BUG at fs/inode.c:611!
Call Trace:
 evict+0x282/0x4e0
 __dentry_kill+0x2b2/0x4d0
 dput+0x2dd/0x720
 do_renameat2+0x596/0x970
 __x64_sys_rename+0x78/0x90
 do_syscall_64+0x3b/0x90

The bug is due to fuzzed inode has both inline_data and encrypted flags.
During f2fs_evict_inode(), after the inode was deleted by rename(), it
will cause inline data conversion due to conflicting flags. The page
cache will be polluted and the panic will be triggered in clear_inode().

Try fixing the bug by doing more sanity checks for inline data inode in
sanity_check_inode().

Thanks.

-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
