Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BE79D0AA3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 09:14:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tCwtv-0008Q4-2V;
	Mon, 18 Nov 2024 08:14:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tCwtt-0008Py-Ue
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 08:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CMcdaDYG/gFHYNvyeEMQ2QaZYaHi60OIh+hXNlJl30s=; b=c+yxMMtQOOmgrvv51lcfE2wtO/
 tfSBv3qlaaIm9b2BdjQIPhHwbVi5JyjkcTcxGUPSbTlumOBQFlEkzG0mGqB69rjTYGEp47YTxaiyS
 EWwhjNkCufYegMqE2uX8R40WOJEtR0wR8ZiWLNrhLL9iCXbSSjnYw2NeKSukU5kJkzfw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CMcdaDYG/gFHYNvyeEMQ2QaZYaHi60OIh+hXNlJl30s=; b=VyfitrIplG1rx+wEeotsivE8rs
 IsiMcPMxb7TufqkWm7eGOPfYnOPwi+TTUr+IyZSS23L4tijD/gsbHcktLg37v/UoPtuAPBo+yO3VB
 IUL+36Mx0rRyUgUs9q5OuYtZM1MzhQDZLbknVa39Ej+NQwqwiQWphwP3l8Jv7QfbQi7A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tCwts-00011W-95 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 08:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 956025C5746;
 Mon, 18 Nov 2024 08:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B82C4CECC;
 Mon, 18 Nov 2024 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731917652;
 bh=xTqkpiNtWzScx2UhoZf8aeDQxu5Y8IDbmaRI/71QrJE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=R3bsT4t2gu0RNDSnckibOpoTVglBTM4WTqVgFbatK3TlKehExrq1TQJVYNeuPUVnP
 xR0lVIEHxl6MFOQwolm0ZpOyyYuhx34G9DMsZL/vKveqfZnDayaKdqHP9JKUA+ugbL
 4l/38UP/RKFiVyJz7lHWC2z2Cw5NjLE+omUbeGDLKZicO0it76Lbq0UrFKVWwLV/XR
 87AQPIXV6RVl1FQ99vzl5Qb8k3VCuu7FBK90Z+MLydUfs9oUrzt3OJjbjoHByCzJvh
 payuFIz1g0yiuDlXAZFWJ9vjOSl/8DOrWuc9o8s3Yg6dscOni92jQj0liFA+tkN9XP
 bbk5jFOzbnyHg==
Message-ID: <4ab5c6d1-9ce0-40aa-8fdb-340a50db3bec@kernel.org>
Date: Mon, 18 Nov 2024 16:14:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Yang <danielyangkang@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 open list <linux-kernel@vger.kernel.org>
References: <20241118070141.3474-1-danielyangkang@gmail.com>
Content-Language: en-US
In-Reply-To: <20241118070141.3474-1-danielyangkang@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/18 15:01,
 Daniel Yang wrote: > strcpy is deprecated.
 Kernel docs recommend replacing strcpy with > strscpy. The function strcpy()
 return value isn't used so there > shouldn't be an issue re [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tCwts-00011W-95
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: replace deprecated strcpy with
 strscpy
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/18 15:01, Daniel Yang wrote:
> strcpy is deprecated. Kernel docs recommend replacing strcpy with
> strscpy. The function strcpy() return value isn't used so there
> shouldn't be an issue replacing with the safer alternative strscpy.
> 
> Signed-off-by: Daniel Yang <danielyangkang@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
