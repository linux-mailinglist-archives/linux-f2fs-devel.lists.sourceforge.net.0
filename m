Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D89872CB5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 03:23:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhgwj-0001lP-NG;
	Wed, 06 Mar 2024 02:23:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rhgwi-0001lG-Oh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 02:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7XM/Llgj8lwiCV2cACXxyMAq73xPB1otmD5lKBKLUY8=; b=HFU3YLbyPHcxjeDwrTwEMRQ+sD
 o0mroVw2AwpX/aQGMpq8rFB+yQSLE4ExM1ZxPVHJ6WJtVtdjKJJZhIg+4aZ/CJJar69ML04nXLja0
 NN/wRQEYqPv7GZ3S7QnaCrSx81i66diHukKDhawHwCUGchWH01B+HYrEAohUst/JPtJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7XM/Llgj8lwiCV2cACXxyMAq73xPB1otmD5lKBKLUY8=; b=G9C1zkzvhZNxizzyv6e9g7TYdv
 Ujh3sqJAS3vQnWR814tOo3upvlXMEK2Uti7Ev3aIAnIbxsMXljDvidnYHvRq7kOVIFc4arDxKBCSU
 gdkprfllTom1xMn4hBf0ABPgJDQ16HntoSz+CTRCc0oCggUESEVlSClZYvkTfpN7KjD8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhgwb-0007TD-UC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 02:23:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 59674CE1E88
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  6 Mar 2024 02:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B4FC433F1;
 Wed,  6 Mar 2024 02:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709691819;
 bh=thzyX0QVW7HCmD/AS2IUCEdrgCJD2FDngBW5T7A+LDg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=rbxhxhWoauShrqAED6RbMQJ/l4S7v/CLzCOob8mtA5OwApBBzYLh3TF2BdWizUoJg
 tSkgVlYC4X6YghhSZBVizxopWus6pN0+HrQPtiARiVa8hK9lrzS6SqMib6LgXiCVbx
 zgHaedhVFaMCAbBNEgYw2eIwo5pLL1tbIl4SUXuNwqUT8Z/Kke6sxlOLNyVkSQcf8J
 f6dewf2Xo8ZJToUJRT0O/XSbCzJaOMaguo7qe5aORGHxH09hMrgA7SA5G4D3jMMExZ
 IsZCtATLpHb9zFGGIxko175wyrfOkUWVsGzbHZEGaVGos1fKQzIeCvVVdjISMzqGUQ
 34zu+U5KfbMJQ==
Message-ID: <85cd3edf-8256-44d6-8dac-eebffb90fb52@kernel.org>
Date: Wed, 6 Mar 2024 10:23:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240305001709.637722-1-jaegeuk@kernel.org>
 <ZeeqmMT8sdPyPKi0@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZeeqmMT8sdPyPKi0@google.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/6 7:28, Jaegeuk Kim wrote: > This patch adds the
 disk map of block address ranges configured by multiple > partitions. > >
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org>
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhgwb-0007TD-UC
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add a proc entry show disk map
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/6 7:28, Jaegeuk Kim wrote:
> This patch adds the disk map of block address ranges configured by multiple
> partitions.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
