Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880250DD8A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Apr 2022 12:03:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nivYl-0007z4-0Y; Mon, 25 Apr 2022 10:03:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nivYf-0007yQ-VZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Apr 2022 10:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LbQtmM5l7QUARSB8GQxlm7wZiYwsff56mksfgePVZmw=; b=Wag5a92gsuWYPwdKe/Z3ZRtpOT
 z4tZGN7ICDsBP7rMBu1/dcLTIasHH/NcAiHOf6nkU/FqwzlPOYasr7lcf3nxdjfKjFam02NZ9IMen
 aXS3VHSg9iu7MX7Oym/zW9x45T5PCQltbjg5gVO/9prLXFLG2DggkDJq+eYANfy+wqc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LbQtmM5l7QUARSB8GQxlm7wZiYwsff56mksfgePVZmw=; b=hJ5ZaoolfTp4Vp/oa0Gk1fB3RZ
 cJK9XQDDzi2+3kf4hNYP3SVLBRif2t7L0Hkk7WPsDkcrnyUbNMQaCOKPp4vwWtUYdaVSZvvALIJPV
 k7v/lwxsP6FAkcpmkYY9t8zfEWuQEx7SpmqBBfv09F6kHsTz3GQf+pmiFJtdyr0JLmMI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nivYc-0008CM-0V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Apr 2022 10:03:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC8A460BAA;
 Mon, 25 Apr 2022 10:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4CAC385A4;
 Mon, 25 Apr 2022 10:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650880971;
 bh=3KUK5Iy9tyGmVhtqeaejKeEnBfjN3F6ieSUR/UDp2YM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hECEK93ALFSyB/IPtBl2eMxagXDcR3cPDinq3jRTyxDoZKPfVy5mbAxEnLycImDiY
 ez8WEL8jLfk2sRsNgV9JdNUszbzKU7KxkbrG5+V1Mr2xXGlSHja+rDDjDlbh7xEquM
 PC28S6DZJwV9JHGg8SdCx4+Yemg9xfrzvG0hj2GGZhwrWsrWjbMHmOUA4TtumNl0jF
 jr94MRSuoAA/Zqc51OO+rKZfhgu9qwmT1AEoU9UnGDTSdWFxJYYRkVkfL78C7DgUke
 DKBUTGvAB2KxPfPJ8B1WXQTR05pPRAnLZqh90Z3HYOW4JgoUtfETlieEIdKn8PoLVG
 NpJ5D/lpHI8iw==
Message-ID: <cbfe3fe4-b9f1-70a0-babd-e2329a61bcea@kernel.org>
Date: Mon, 25 Apr 2022 18:02:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Niels Dossche <dossche.niels@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220422180503.14463-1-dossche.niels@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220422180503.14463-1-dossche.niels@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/23 2:05, Niels Dossche wrote: > There are multiple
 calculations and reads of fields of sbi that should > be protected by
 stat_lock.
 As stat_lock is not used to read these > values in statfs, [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nivYc-0008CM-0V
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: extend stat_lock to avoid potential
 race in statfs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/4/23 2:05, Niels Dossche wrote:
> There are multiple calculations and reads of fields of sbi that should
> be protected by stat_lock. As stat_lock is not used to read these
> values in statfs, this can lead to inconsistent results.
> Extend the locking to prevent this issue.
> Commit c9c8ed50d94c ("f2fs: fix to avoid potential race on
> sbi->unusable_block_count access/update")
> already added the use of sbi->stat_lock in statfs in
> order to make the calculation of multiple, different fields atomic so
> that results are consistent. This is similar to that patch regarding the
> change in statfs.
> 
> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
