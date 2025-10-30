Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB55AC1EA0C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Oct 2025 07:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMIDrrQDHs0YAoclmtxlb+9zOZXDtcWG28pgAWhAuSU=; b=HkN7U11G2yWOTNZWfUtrB07dMh
	cZxNrcZMYnDVX75TgJ+aju8RcsTqk6hU9WmGQ1TpFM9BNxX1G9DvckGVUeDGQUpuNe0tjGdG5gdgl
	76g/EcrJYfbt39v6LRv3gPlF+rYv1J/dEgddbMUujsVvXNH48GRvnH2/OvOU+QxCENw0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vEMUY-0001sG-MN;
	Thu, 30 Oct 2025 06:50:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vEMUW-0001s8-MW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Oct 2025 06:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E1eJr/HufGAUVOkyLTaded9w5xBldiIJltEx5C+xM6U=; b=Q5PWy8s1LxKJPMivqRjtrirtCL
 oguYIvS5xHxYmMWwoShLS0o2M6zeWwQSoJMw4Hy/8ObKy29DADmJCQAmUR5ahv5RNWOva3xoK23i+
 7Ie1pPL8EvFWp7a6Dn990AQREDZYll7LQRdqgCUXUmHFVKG8xyZjm27iC0gAZbk4ljfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E1eJr/HufGAUVOkyLTaded9w5xBldiIJltEx5C+xM6U=; b=IGgDR2lldov3/xq0jF7yakl+lo
 K8eBc5cldiKTDlcqfFxYDh4SNXaS1p4+tZoTQBJ5b7Qx25atQzNTcI6d9ux+SM+hkdYdR0zQfpLGa
 EN+CBtf+Xia9dFLt85wAXSJWcL8oQPbM3gw5Rt+mwR3D5VU3TkfQntawCcOhDzqsDK+0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vEMUW-0001FO-7W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Oct 2025 06:50:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C89C6036A;
 Thu, 30 Oct 2025 06:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74A9C4CEF1;
 Thu, 30 Oct 2025 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761807025;
 bh=ZDSDO4xje51D+u1Yg+tz6FNILft6gTJ2PTEcBB+My8k=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=VrmPvf6Ksyp1U2rcKmNNDYTgxhfPDAsSEunNr7LzehBIafrn4mTSUdkI6RxIy9Es3
 tdKIrg0RdgTUlQSM11muiarrBKYKBu4d0dreP01ctE+Sta7K1dQrwv24MSDrL9zSeL
 orbAaBeRFhb/l1DqkfdH+Egf/GGFQKJxF5d1EGNj+sH2YQG0tuq4w7a+0ZuAhB+Soq
 yOclCTTszwVoxnk66VZPRCUe/L/nmMmrnXZgXcmz3/sqtPmoYHsGEkwuOgOXgF96rP
 ETb8CbHoJ8rN4ZRB9ivT/VSYZ28/mzfv2pqHZJk4G/DU8fJ/GJrU65CAJ33XVY/kdB
 Hc/7XCNkYfBAA==
Message-ID: <010cc7fc-4d51-49b3-929a-06b1e408580c@kernel.org>
Date: Thu, 30 Oct 2025 14:50:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joanne Chang <joannechien@google.com>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org
References: <20251030054540.278518-1-joannechien@google.com>
Content-Language: en-US
In-Reply-To: <20251030054540.278518-1-joannechien@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/30/25 13:45, Joanne Chang wrote: > Currently,
 the created
 files are filled with 0. When filesystem level > compression is used, they
 take up much less space than expected. So > the final falloca [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vEMUW-0001FO-7W
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/011: use random data to avoid file
 compression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/30/25 13:45, Joanne Chang wrote:
> Currently, the created files are filled with 0. When filesystem level
> compression is used, they take up much less space than expected. So
> the final fallocate does not show an error.
> 
> The created files are filled by /dev/urandom instead to ensure they
> are not compressed. This way the files take up the same space whether
> compression is used or not.
> 
> Signed-off-by: Joanne Chang <joannechien@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
