Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA38A98220
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Apr 2025 10:04:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7V68-0002PS-Qg;
	Wed, 23 Apr 2025 08:04:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u7V5O-0002ON-Kh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Apr 2025 08:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b9Dm+F1tmJAZbQmAi1t3GI5CpN3cSmuJFbcN3qg2vu4=; b=Yn6o8DlpI/Vrtzu/SJ6e0eXOEp
 Ys2rtlGJc0w21aEbsWzidN8jSEKEOYCNyOKx3Wwgx/8VjBTQMlJ0cattVvMDPLXd3pseB4CJ/cJ0v
 sI2ZkD6yze2axtJGzilBIVY3Tdvma8GCeQ1FHArHTwPdzatO2kKY0jz4GtvPdcVSAAKU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b9Dm+F1tmJAZbQmAi1t3GI5CpN3cSmuJFbcN3qg2vu4=; b=QqxJ1iwK83swmH/ceZEH83BHIj
 tlvdxV9lhpQSedTblsS49NQdMjaFPTBZLWh8mIul9EHYJhupKx+KLrqal+ONBB3O4qBTk30XfsQZ1
 Oc8u0ClhW4E9SqKfJZEV0S50nulpQ2A+tjTcRXBmUcP6oDEndRxDV9ysWt0xgRqwX464=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u7V59-0007cx-0y for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Apr 2025 08:04:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9C5C861569
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Apr 2025 08:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50423C4CEE2;
 Wed, 23 Apr 2025 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745395416;
 bh=inlMUCRFqnABddpRCcfNzuNn6R9QuNDbo71+V8QxfT4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=evJwpepg14qfzt0hV8YLwoloJgNloVm4jxaeQTZRoOoBefyF7ScyAXUqtXQjazVQi
 WPVYNz4y5jKFJtQmZOfABgEUcClRr5pJqq6Qp3T9tIj8AzIc/QvyE/31EMc6a35ahh
 8vaTVTXN34lAL/KiVguZhxbjm6dMPDWDTsK0xn0EUulLG2YE5A+UQF0D42jEK1nN9A
 Vo/H4kNv/QkOq2XW8sWpogNGKRgjEyJ9QY4KZxke0zusO3Tq/oJmeEootoQ/eVB/66
 Sd4ycL3321/u7fxRkjRX3qZLtZNfyehWUbVuGiNVF/fLoZQgddC9bFz3KMBJQorZPv
 qRstFfwa3DSAw==
Message-ID: <7699941a-67c8-40d4-a8fc-9e82e42cec34@kernel.org>
Date: Wed, 23 Apr 2025 16:03:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250421161555.1630917-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250421161555.1630917-1-jaegeuk@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/22/25 00:15, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > If the device support write hints, let's assign it in Android devices. >
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org>
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u7V59-0007cx-0y
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: enable write hint by default
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/22/25 00:15, Jaegeuk Kim via Linux-f2fs-devel wrote:
> If the device support write hints, let's assign it in Android devices.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
