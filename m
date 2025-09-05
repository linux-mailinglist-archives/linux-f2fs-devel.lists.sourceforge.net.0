Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0666AB450AA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Sep 2025 10:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZcZdqwL5FFCrSh4oguZJjux61QpvfZvVF6ejdY/HTI=; b=ZSotMuofVDiiwEk09r093W7a9Y
	tspQbkQkELOVxdszvFOV3YBzbZmcRiyLODLrVgbTB+ZJNCGcPBlYJKM36giVB84QEswO+8Ki3X8l7
	deDXMYt3BHLJwVJUOqh6iyN+tlgIq7cZ+hygn1Ev8LAyrEEsVgM3H3ZbEzj0d5z8wfTQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uuRNj-00031N-En;
	Fri, 05 Sep 2025 08:01:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uuRNg-00031D-DF
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Sep 2025 08:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KyHfXAym+grpNRS9OS0T7RI8HQ9iK1Q4BAHuLRN4MeM=; b=QduOBcpJCklxsJ2tQH31/3u/tI
 wUFDCULSHHaQBtthjK/TdqYoAnomjnMRxvc8CYdMOCByzqTqwh3367r6XBwMFNiQADICyTNbFw05y
 lt1XNn/ByjtkiiFlfi43uPzPY3j7nS6kyK6fEj+SVUQ6+/ED8xco+641SBFha+Ti/Jaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KyHfXAym+grpNRS9OS0T7RI8HQ9iK1Q4BAHuLRN4MeM=; b=gyDon0mQwQLOli4RKunjcMRInp
 4fTPTO7ZKl9S+J5w/xtkAN4LkeIuzTlYZ0TdXDXFyMXxdYcGVr8AMD9PY/s+jmJXW64MNlCdcDdFY
 Bq0Ir2JexMawvJXkL8qJOulqG8bu/LyfJNmv/qqSrtchjOQCLmJZWy4yw2YYj7tmvu/o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uuRNf-0000Ol-Qp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Sep 2025 08:01:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0B4566027C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 Sep 2025 08:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F11C4CEF1;
 Fri,  5 Sep 2025 08:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757059260;
 bh=x1Sq0Ob26LdMRXj2JcZzPqzEsUDByjP1rR4VD9pX0ik=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GPP79ayHyRytP94uYTcubBpluRkKQUd/kFRKLbktf+irCrguiYt6YT1MQGDdrHuWU
 iyyE3CQzBXA1xv7QZVsDgZO7tCTsiLjqlyJSb8dUvsoBGPnERTwOOmlJLS/iGPcbzw
 dersXA01LxWmW7aJrIBhy0grs9P9AiV2upnUAE4+PkICgZRLqz4bdU4igOIuj9tQsU
 c4WrqN/YWLw9gUJB+Te0h+tXe8CxnfOz/0x5aCKEQ9wshZPMn+g2bQ1AppNvzrQT7b
 tXkfachKLDHsdmyA1OukVohLjDeKYj1aPIXKFLv29PqTHshi7VYDTtLqxWp+IeJKWL
 OM2H3e28rW4kA==
Message-ID: <b8fd703c-f320-45c2-bd2c-d5ff5ca637ad@kernel.org>
Date: Fri, 5 Sep 2025 16:00:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250904181642.3879283-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250904181642.3879283-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/5/2025 2:16 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > FUA writes can be merged to the existing write IOs. > > Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uuRNf-0000Ol-Qp
Subject: Re: [f2fs-dev] [PATCH] f2fs: merge FUA command with the existing
 writes
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

On 9/5/2025 2:16 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> FUA writes can be merged to the existing write IOs.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
