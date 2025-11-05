Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F09EDC34EA9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 10:43:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ASUIUjvx9pLhl5/015LxwFOiHa49Cpqrg9urOgkhgQ=; b=QgUbYIybLQJJsDMI0q0z3odSvm
	w6S0utwAoDWpOHwTCSfP0HsYHJCGw6vQMUDsEnnaKIhZXBEf/aYjEV1HwFLvfJUAndsSNrpBo2Vos
	Ux4LDvcwAMBOqQ/mTGEVi/kl+F3XKUWE3YYwTc/1V1Jia5r6pWHiRakjhxlWubZrc4g8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGa2g-00066X-Mh;
	Wed, 05 Nov 2025 09:43:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vGa2f-000668-5J
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 09:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KXRok4kE6mJNe0TR4x/emmi/alRKWb8RgbjHL1qHZzM=; b=XlkV+LCliQk0+Kn2PnsO8O6DEW
 BIKzJKEzDu7Kk6ePOoBJU6ZLBHW7TjEpAcfG2jifVIosSWEpUI3wbYnjGC8VTbA9rLoGz0ZC3b3eo
 2y3GrQctX0pFrehxqbxncnWydi+oFyCDpH9gqh1KIxXeDzrY2kCgOwur3zlbnpfK4FB4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KXRok4kE6mJNe0TR4x/emmi/alRKWb8RgbjHL1qHZzM=; b=ZMbjFw1wwuHwmlwiNgSJNd+BtX
 e5czoNeRFvV17JqTk+QdjhAdbY6SKapnkJ83LeqHa5veoCVPK81mkG6wrp/8TKQ3dEf5VSuaYDUGz
 1Zo8ayJVksgLg+rcfrKTmblUWOY0ol3UYGpoyFTA2L9VNr7I33Lvt0jDI63+Sxdq5ob4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGa2e-0007oK-CO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 09:43:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A1C0560205;
 Wed,  5 Nov 2025 09:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15F8C4CEF8;
 Wed,  5 Nov 2025 09:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762335769;
 bh=gR67EH2yP9lSn4ONpm8uJrVynpMjctZL7TDFZrX7Q0c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=i05Nw8ZxqtMlhl2W3pqtrYZXd/6jrcpaHYNgmhcV/UX4nVr2dpOiic2dBqDa9b50A
 z09N2HXHoXkZG84XKsfGZwycAz7xzQMOucMN0dk5x/sjxuXkJMbwRi1JD7vO0AxE0t
 pHVibjAz5qpfR2LLZQRFehpX7nDU783Y+lZ02SY413CmZFcM2XWS5r/4m9OmekJDth
 lFZor0/CIFgI30jrG77yJL2TaoK/6YV3NcF7s38r06B+xyqWd2suzpyraLQe22/1fY
 ESjiS9IUMJht8ZeKn8irTZ72kD+GuZoZ2pBrlTgOALQgO8C3ceaQAYUeDoWQVpzVdh
 mnPDa8OK8RWPQ==
Message-ID: <84a7c83b-529a-4fca-a5d0-4d2015bdeeab@kernel.org>
Date: Wed, 5 Nov 2025 17:42:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20251104162226.919906-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20251104162226.919906-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/5/25 00:22,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > The recent increase in the number of Segment Summary Area (SSA) entries
 > from 512 to 2048 was an unintentional cha [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vGa2e-0007oK-CO
Subject: Re: [f2fs-dev] [PATCH v4] f2fs-tools: revert summary entry count
 from 2048 to 512 in 16kb block support
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/5/25 00:22, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The recent increase in the number of Segment Summary Area (SSA) entries
> from 512 to 2048 was an unintentional change in logic of 16kb block
> support. This commit corrects the issue.
> 
> To better utilize the space available from the erroneous 2048-entry
> calculation, we are implementing a solution to share the currently
> unused SSA space with neighboring segments. This enhances overall
> SSA utilization without impacting the established 8MB segment size.
> 
> Fixes: 50fd00b168d7 ("f2fs-tools: Support different block sizes")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
