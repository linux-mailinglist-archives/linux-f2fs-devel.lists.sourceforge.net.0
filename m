Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB91437893D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 13:51:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg4RI-00051R-9e; Mon, 10 May 2021 11:51:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lg4RG-000517-R1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 11:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/CkgwvJ+1YN4a+lYLMrcrSI0PubyK10MuPv0gjiwIH8=; b=EnpI+CUBcrBITnIzh6IpjuEuw5
 pQ3/ZDULl1uG+17GcGtrEadXd9PBwFU4EXfmNOE/g9KHB1PZKEZwVjVxbuaG+qU0H0hCWVzFL6RdK
 R0YFTyHXv+5MiLz15R7wyum6ykmBqhJ6dm1bViY0IZZ8LauSVjeVmUyl6XoMmWLDIGic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/CkgwvJ+1YN4a+lYLMrcrSI0PubyK10MuPv0gjiwIH8=; b=XSrTymJOyFVbnKawp+UHog+U/w
 YPRd+JS7KIMOEX5111iJlOo4Nc49TouHYorvl3qXuRXJC0LXFCSw5fM+820R1L3FIA1lBXTL9PycP
 Cu6Ccraq2HQNe1QSfdG3cJlzKK1Ksolfbg059M0RD3aUCIyOf9O4EXtWPJ8s4hiHC5TE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg4RA-00050a-Bc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 11:51:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B7FD61628;
 Mon, 10 May 2021 11:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620647450;
 bh=24axoO7AJmJExXSUrvkd+ML2tdRF/FXgk5uq6T0eaTk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=m1JtWtTk4z8ZY7uwEXnQTAjp5xIseaq4Ez3Cn7sGFOPetCyujFsH0tfs8MFLhUO82
 Yk3Sbx74T9jqDgdR+ON2FF2e+u8fF1GXADYq5H4kZbkQNskLAOAEFXhkVTbaIDlMco
 GkPYtod7C05TApQc0B+6cjIvY/yi5EC8Kwm6/A6fjsshOlg9otmrlmyciTaGLMy1Ij
 YtvygI9L6btI2f+FrSYIxuWW1+F/4wKiqF2pe7Ft+WwYZx/LJ0AGRAuiJktMRKW0Xw
 jemjzFoWRTqXX0Ku5n6trtrxDz8VMaHZD0QuD0icqNWtbIrj6x0GpyG/h8tK+XaYJ5
 BzWHhjnnOcBeA==
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210510112444.902964-1-shinichiro.kawasaki@wdc.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <f7d561a9-3404-7ce2-21ef-3de583f22db4@kernel.org>
Date: Mon, 10 May 2021 19:50:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510112444.902964-1-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
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
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lg4RA-00050a-Bc
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Prevent swap file in LFS mode
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/10 19:24, Shin'ichiro Kawasaki wrote:
> The kernel writes to swap files on f2fs directly without the assistance
> of the filesystem. This direct write by kernel can be non-sequential
> even when the f2fs is in LFS mode. Such non-sequential write conflicts
> with the LFS semantics. Especially when f2fs is set up on zoned block
> devices, the non-sequential write causes unaligned write command errors.
> 
> To avoid the non-sequential writes to swap files, prevent swap file
> activation when the filesystem is in LFS mode.
> 
> Fixes: 4969c06a0d83 ("f2fs: support swap file w/ DIO")
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Cc: stable@vger.kernel.org # v5.10

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
