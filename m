Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 044958F842
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 03:02:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyQdg-0005NG-K2; Fri, 16 Aug 2019 01:02:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hyQdf-0005N9-B3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 01:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DfztsjXy4vYdJ1MoXQJFK39S8uAZot2n8MBFIrJRWMI=; b=S2tnEzRspI0Eo42AkXogL+u9CF
 1YABpkdumBFJ0Qg5CZh/e/aGKFU6koAg0FDg0ptL3zkw/FIF1k+IeWbxKh74BefX9ClOAXB0CUWyQ
 80NvW75FODAAnRO+OgB1+ctnF8DVnsHtpbxlGz8fdAAA3EwB0kSs9oAQKM6vradiyDm0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DfztsjXy4vYdJ1MoXQJFK39S8uAZot2n8MBFIrJRWMI=; b=PRpBoEADHbYkV3lXMGXl73wOkI
 k6rksEJQpLgZJg/ecD9YqXnDND3G9aAbbpHrJ4K/5PRyEMERzpc3/WvdL7UAlHJZvbuilLGQTv+yp
 y5thTWZywJiiZKqdDWMLJHcPDqYqgqODmLj9QuLtLhDzbsEB/RBmR+IdWnEvSSUjDoqY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyQdY-007io0-AR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 01:02:43 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE117206C1;
 Fri, 16 Aug 2019 01:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565917350;
 bh=sk5XmmcbcD+fn6vB2HPDYdrlC19xukuY6M5o6Q6cXOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tr9B+kZe4IUq6EnbpkNzOTWY1GT/yhlPzZaf73w5E+E7QMMbQy83/2tMZB5o3wrwT
 z6RzluZWPddqZhKciNq2g4n+z2VdY6LFFbWhklZ351JIJNwyQZLlrBmAQFpQCUvmP0
 65dwaFIaysZ2O6acltcLEBw2kyKzCOtIVlu5MEMA=
Date: Thu, 15 Aug 2019 18:02:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190816010230.GB65786@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190808231108.75599-1-jaegeuk@kernel.org>
 <20190809151253.GA93481@jaegeuk-macbookpro.roam.corp.google.com>
 <9e3ccdf8-6280-ac8d-30b7-e89d54f5b6c9@huawei.com>
 <20190815222127.GA60095@jaegeuk-macbookpro.roam.corp.google.com>
 <635c9a57-da04-c215-0bd1-2e76118b99dc@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <635c9a57-da04-c215-0bd1-2e76118b99dc@huawei.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hyQdY-007io0-AR
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: check zeros in first 16MB for
 Android
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

On 08/16, Chao Yu wrote:
> On 2019/8/16 6:21, Jaegeuk Kim wrote:
> > On 08/12, Chao Yu wrote:
> >> On 2019/8/9 23:12, Jaegeuk Kim wrote:
> >>> We actually don't need to issue trim on entire disk by checking first
> >>> blocks having zeros.
> >>
> >> In heap mode, we locate node log header to tail end of device, should we
> >> consider to check block contain according to heap option?
> > 
> > I wanted to check F2FS metadata mainly.
> 
> Oh, I thought you mean main area. :P
> 
> > 
> >>
> >> BTW, if we changed cp_ver whenever mkfs, why should we still issue trim to
> >> obsolete old data in node remained in image?
> > 
> > For simplicity. :P
> 
> I didn't get why we can assume all metadata are zeroed if first 16MB are all zero...
> 
> BTW, if first 16MB are non-zero, why not just trim F2FS metadata rather than
> whole area?

Trim the entire space so that we can skip discard in runtime by the flag, right?

> 
> Thanks,
> 
> > 
> >>
> >> Thanks,
> >>
> >>>
> >>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>> ---
> >>> v2 from v1:
> >>>  - clean up
> >>>
> >>>  mkfs/f2fs_format_utils.c | 53 ++++++++++++++++++++++++++++++++++++++--
> >>>  1 file changed, 51 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
> >>> index 8bf128c..f2d55ad 100644
> >>> --- a/mkfs/f2fs_format_utils.c
> >>> +++ b/mkfs/f2fs_format_utils.c
> >>> @@ -25,6 +25,7 @@
> >>>  #include <stdio.h>
> >>>  #include <unistd.h>
> >>>  #include <stdlib.h>
> >>> +#include <stdbool.h>
> >>>  #ifndef ANDROID_WINDOWS_HOST
> >>>  #include <sys/ioctl.h>
> >>>  #endif
> >>> @@ -110,13 +111,61 @@ static int trim_device(int i)
> >>>  	return 0;
> >>>  }
> >>>  
> >>> +static bool is_wiped_device(int i)
> >>> +{
> >>> +#ifdef WITH_ANDROID
> >>> +	struct device_info *dev = c.devices + i;
> >>> +	int fd = dev->fd;
> >>> +	char *buf, *zero_buf;
> >>> +	bool wiped = true;
> >>> +	int nblocks = 4096;	/* 16MB size */
> >>> +	int j;
> >>> +
> >>> +	buf = malloc(F2FS_BLKSIZE);
> >>> +	if (buf == NULL) {
> >>> +		MSG(1, "\tError: Malloc Failed for buf!!!\n");
> >>> +		return false;
> >>> +	}
> >>> +	zero_buf = calloc(1, F2FS_BLKSIZE);
> >>> +	if (zero_buf == NULL) {
> >>> +		MSG(1, "\tError: Calloc Failed for zero buf!!!\n");
> >>> +		free(buf);
> >>> +		return false;
> >>> +	}
> >>> +
> >>> +	if (lseek(fd, 0, SEEK_SET) < 0) {
> >>> +		free(zero_buf);
> >>> +		free(buf);
> >>> +		return false;
> >>> +	}
> >>> +
> >>> +	/* check first n blocks */
> >>> +	for (j = 0; j < nblocks; j++) {
> >>> +		if (read(fd, buf, F2FS_BLKSIZE) != F2FS_BLKSIZE ||
> >>> +				memcmp(buf, zero_buf, F2FS_BLKSIZE)) {
> >>> +			wiped = false;
> >>> +			break;
> >>> +		}
> >>> +	}
> >>> +	free(zero_buf);
> >>> +	free(buf);
> >>> +
> >>> +	if (wiped)
> >>> +		MSG(0, "Info: Found all zeros in first %d blocks\n", nblocks);
> >>> +	return wiped;
> >>> +#else
> >>> +	return false;
> >>> +#endif
> >>> +}
> >>> +
> >>>  int f2fs_trim_devices(void)
> >>>  {
> >>>  	int i;
> >>>  
> >>> -	for (i = 0; i < c.ndevs; i++)
> >>> -		if (trim_device(i))
> >>> +	for (i = 0; i < c.ndevs; i++) {
> >>> +		if (!is_wiped_device(i) && trim_device(i))
> >>>  			return -1;
> >>> +	}
> >>>  	c.trimmed = 1;
> >>>  	return 0;
> >>>  }
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
