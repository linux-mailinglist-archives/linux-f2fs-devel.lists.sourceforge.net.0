Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08D8FE43F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2024 12:27:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFALU-0001J6-UI;
	Thu, 06 Jun 2024 10:27:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sFALT-0001J0-3n
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 10:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C9vmwlud++xMWxUz3Vm0cYg/FbA07RW2pWBQFjaPeT4=; b=LojZ1ezwuVewlkxWCHO0lyZQ4y
 HOMLd7dREu3s3nGwk6HmpMBAl/8xJf/7BIeIpXP+DU3hwP2GihvkXRFPwTMxUauFxZWTJ9dHg4wZg
 tVlcohxT1ApSA0Tk81hvvqhErYxqSz1mA1YaM07G+oof/Hny5/KHbzwqcGuijnL+B1HA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C9vmwlud++xMWxUz3Vm0cYg/FbA07RW2pWBQFjaPeT4=; b=HGctpYKX6r/SYO+G9MNB1S0Dz2
 2q6t8Oh5Qds9YLuxuK3xxf+g7hUiUtVHmGiUQiQY3xQ5eRYQFhL4rx5pAH+VDRCtnuXtq5nqpFPQM
 ztVdVzXs5YJkd01sRWuVxJnRiQK2lOfe4ytwYN76ghpbVgchFfG7k7yPO1EAwd/rzGlg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFALT-0007Mh-Hq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 10:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EF082CE1048;
 Thu,  6 Jun 2024 10:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEDFC4AF0E;
 Thu,  6 Jun 2024 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717669558;
 bh=EML4Iu9obdDE1EzLWPCy+Tg6xc1taE+7rID1/jbyoWE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=adTpfS4u6O7p4cccXFmpZ6PGWSlYTab+RkGczPewwAisg7qVq3ZDcx1/X5/+vSDMU
 9+uPjcTeO+6x90ZSsfWJExpRNXRt1DdeICbRWWOd8HXiLECUnbhglu9Citbj4LvXCV
 Q8HPgl9mzJfYorBONIJcLnR3nOsL5s1SO0QNtuHd3SHr29bsqmCocVKKS+iZQz88WQ
 sL1eCqUp4M6h8yoU6vEtqtS74xKvIOttDQ8H3JFWBXEbrp3R1ikB5yuguCRcEN15sb
 NP1ub/QQDsdFU3ieXtWkjprff5hBl5iPS+7xhe2VJV/a3WP61+xPDkx17IG6jsPLde
 asMQahX3PzlOw==
Message-ID: <62c9301c-eea4-4e35-9b6e-04525769985a@kernel.org>
Date: Thu, 6 Jun 2024 18:25:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wu Bo <bo.wu@vivo.com>
References: <20240510023906.281700-1-chao@kernel.org>
 <20240515083219.1601289-1-bo.wu@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240515083219.1601289-1-bo.wu@vivo.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/15 16:32, Wu Bo wrote: > On Fri, May 10, 2024 at
 10:39:06AM +0800, Chao Yu wrote: >> If lfs mode is on, buffered read may
 race w/ OPU dio write as below, >> it may cause buffered read hits u [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sFALT-0007Mh-Hq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid racing in between read
 and OPU dio write
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/15 16:32, Wu Bo wrote:
> On Fri, May 10, 2024 at 10:39:06AM +0800, Chao Yu wrote:
>> If lfs mode is on, buffered read may race w/ OPU dio write as below,
>> it may cause buffered read hits unwritten data unexpectly, and for
>> dio read, the race condition exists as well.
>>
>> Thread A                      Thread B
>> - f2fs_file_write_iter
>>   - f2fs_dio_write_iter
>>    - __iomap_dio_rw
>>     - f2fs_iomap_begin
>>      - f2fs_map_blocks
>>       - __allocate_data_block
>>        - allocated blkaddr #x
>>         - iomap_dio_submit_bio
>>                                - f2fs_file_read_iter
>>                                 - filemap_read
>>                                  - f2fs_read_data_folio
>>                                   - f2fs_mpage_readpages
>>                                    - f2fs_map_blocks
>>                                     : get blkaddr #x
>>                                    - f2fs_submit_read_bio
>>                                IRQ
>>                                - f2fs_read_end_io
>>                                 : read IO on blkaddr #x complete
>> IRQ
>> - iomap_dio_bio_end_io
>>   : direct write IO on blkaddr #x complete
>>
> Looks like every COW filesystem would meet this situation. What's the solution
> of other FS?

I missed to reply this...

Other cow filesystem like btrfs, it will update metadata after data IO completion,
so it is safe.

Thanks,

>> This patch introduces a new per-inode i_opu_rwsem lock to avoid
>> such race condition.
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
