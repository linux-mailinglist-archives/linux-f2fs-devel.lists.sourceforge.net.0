Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E6A28C71F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Oct 2020 04:28:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kSA37-000723-1X; Tue, 13 Oct 2020 02:28:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1kSA36-00071s-37
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 02:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0T3asWHfqUWz0zED1P6OmUdTOLJk2ixaklQ7SuPi8Uc=; b=Ypke5pmuGP5jRPw60KjBb5DTX2
 ESWBqnPmxokDElOzfR6TNmLHN736cGSffK+EOQMB23N+uVDvRFe7rbZDOND2ongLmNvD4p7q5OVJ5
 s+EYzZFYRPJ7TXg3TpEZgG7vIpaXgDzBIokx4mYxVCcQZe+c958Z/GOnKvdnUF1Fds9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0T3asWHfqUWz0zED1P6OmUdTOLJk2ixaklQ7SuPi8Uc=; b=QExy4Azvbnp4YRpeKahQsRDUae
 UAU7UL/olrvdkvpggyQvqJdsgF6yHcXuoUetL7K285G7H67LJz4JWL1kJA5Kgv3r9XlqEBE3StvjP
 wnXitzux5IXtNsmXrRdt17cpZmT5Zvqv0pxhaWQ9wATxKVayCQ+ld1v4Pmt30wGwWSbw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kSA2z-00CvLy-0y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 02:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=0T3asWHfqUWz0zED1P6OmUdTOLJk2ixaklQ7SuPi8Uc=; b=W2otGeGilNTb+3EnbAVR4yGnzD
 09fF9YkPwWDnEmU53QuASiGFLJJDQoyUv+mPN8d9BePXHZI7wg7FVdTPzMVUe/iPA6nf3Cvo0hUr7
 IFAyx9rfusnQAw/Oa7zkosjTemjcSI4+hI8FAdZVNQotH8+CasvFgAYsBhF9wTIa2QxFcfnoNfhqD
 W9s65jYyot111qbyaTVaAVoJrvO6hTXu+42eng/IV4F85AncBm5ec0LYEIcid6/dSKhC57hEgyvlP
 tmktxHEp469oqAT6BsnRyTNyVYSPa6+u3m+mhjtYc+VV29ylezZcy7/A18HsEVMyrRchuv/jUXUwl
 VHTJ68EQ==;
Received: from [2601:1c0:6280:3f0::507c]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSA2c-0005Sn-D0; Tue, 13 Oct 2020 02:27:55 +0000
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20201013022429.454161-1-daeho43@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <55a72698-014a-da39-e573-a8e9e9b52ce6@infradead.org>
Date: Mon, 12 Oct 2020 19:27:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201013022429.454161-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kSA2z-00CvLy-0y
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add F2FS_IOC_GET_COMPRESS_OPTION
 ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/12/20 7:24 PM, Daeho Jeong wrote:
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 53fe2853579c..a33c90cf979b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -433,6 +433,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
>  					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
>  #define F2FS_IOC_SEC_TRIM_FILE		_IOW(F2FS_IOCTL_MAGIC, 20,	\
>  						struct f2fs_sectrim_range)
> +#define F2FS_IOC_GET_COMPRESS_OPTION	_IOR(F2FS_IOCTL_MAGIC, 21,	\
> +						struct f2fs_comp_option)

Hi,

F2FS_IOCTL_MAGIC should be listed in
Documentation/userspace-api/ioctl/ioctl-number.rst.

Please add it there.

thanks.
-- 
~Randy



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
