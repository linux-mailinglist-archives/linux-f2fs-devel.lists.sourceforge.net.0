Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A8C349EE5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Mar 2021 02:44:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPbW4-0005ur-3E; Fri, 26 Mar 2021 01:44:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1lPbW2-0005uk-Up
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Mar 2021 01:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dbqyO5xp+Xc0AkR2FMEhZNoheUZwZy/NovyVB8pJPrw=; b=KELi1cO7hGzx4lZAMIlCQf0osn
 A0HPoZj2HraxIsMJN5eAqwrhthiTzid92QBDwGIag/NhHbiCuy9Xrzhkw07VTH0wybVFJ7SNVbBXB
 2K2BfL/4N12n+pM5LPPHUKnd6mkceaQ3KUDXtGHYDfpzM/Zi9ye1jR62LMhNuEUSktCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dbqyO5xp+Xc0AkR2FMEhZNoheUZwZy/NovyVB8pJPrw=; b=kKlzmDRr5M0Dmat0hcwYmZTsiW
 fOaPwj3EStQYkT7qbkIBP0hFtNCbcXqczpVl0jSp5qXV6AcyTnR7R7Eh5BbX3wttv9jzDWfFy1XyL
 cJik3Hh0TQRbC/t7GG941mW20R8ovH8c9ixQVK3Qjzc/ZekhgEFwX5vZIzRgG0VmFOEQ=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lPbVn-0001WP-4i
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Mar 2021 01:43:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616723023; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=dbqyO5xp+Xc0AkR2FMEhZNoheUZwZy/NovyVB8pJPrw=;
 b=XbZ+y9W31w0564Nf2wd+wtt8aBYvX7lxDq6AtC/zQRf4kDLwD0ijapKq6oX9mq4NE8MsjLUP
 xPnTW55u19P61L4AhNHrF6XYgmwf5EsT3aj2GJvsSvtO1CgwqyAk3kd2Rw5+rhen5ufC3mdV
 TKaFGRLtOKFrdG1fNKDrNWAwW/Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 605d364a04a1954ec3aadf4c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 01:18:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6D06AC433C6; Fri, 26 Mar 2021 01:18:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 67323C433CA;
 Fri, 26 Mar 2021 01:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 67323C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=stummala@codeaurora.org
Date: Fri, 26 Mar 2021 06:47:56 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org
Message-ID: <20210326011756.GE8562@codeaurora.org>
References: <1615886958-717-1-git-send-email-stummala@codeaurora.org>
 <3c453b72-892f-7044-2edd-224b82202608@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c453b72-892f-7044-2edd-224b82202608@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lPbVn-0001WP-4i
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: allow to change discard policy
 based on cached discard cmds
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

This latest v3 patch needs to be updated in f2fs tree.
The f2fs tree currently points to older version of patch.

Please make a note of it.

Thanks,
Sahitya.

On Tue, Mar 16, 2021 at 07:08:58PM +0800, Chao Yu wrote:
> On 2021/3/16 17:29, Sahitya Tummala wrote:
> >With the default DPOLICY_BG discard thread is ioaware, which prevents
> >the discard thread from issuing the discard commands. On low RAM setups,
> >it is observed that these discard commands in the cache are consuming
> >high memory. This patch aims to relax the memory pressure on the system
> >due to f2fs pending discard cmds by changing the policy to DPOLICY_FORCE
> >based on the nm_i->ram_thresh configured.
> >
> >Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
