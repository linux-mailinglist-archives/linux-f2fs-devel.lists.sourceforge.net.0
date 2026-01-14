Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD05D1BDDF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 01:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsNzYYoHBTBXOuTs9nypFp4w7/RTxvbxGz7ulpn+1mg=; b=FkSk4DBXY36PbRfrMrUcYY46FO
	aQMbs5sxphk37YVFEmxdvHylB25J7ciH0V0dXzn1U5yi03zycVCqFxnhQuqeDmzD4uYWvHZN1E1zz
	Sch4Ykna8/J/oNjWU2SqSThKH2DLDTohO2LiqDwb26easx8v/lVt0BfLaTp+60Wcr6sY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfp5r-0000NP-Ue;
	Wed, 14 Jan 2026 00:50:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vfp5q-0000NH-Kd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 00:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fvbNf6UkX86/8M45GQgVmwY6SPNv+sa9yRwvn1EeMaQ=; b=V5oySRA7a57K/AQhU/y2g2YF0l
 InkFCGsZO7dJHLzv9Z3AvR8OOuc/shTL90hJfHLiO0uIFy0l5MlSlpPCmJE6Xg56Qr6cKYL29Hp9s
 eJ0B2IEMvcd+Jm8hvwUE4hOKIw4xYlBrkUGBUzrbFxASYY6ra440fsgd59g15Ro2lD8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fvbNf6UkX86/8M45GQgVmwY6SPNv+sa9yRwvn1EeMaQ=; b=BQbT5mGN68A7cwwwjm+V3scyn+
 /o105232m2Rn2hzP9nCFoltJ8I2Ncusfc8dW7UYlZL9LsOSbfW53EW8rIeNFytpwFRcM6TUGSWRVq
 DVunGhToKvXvKevRU78k2jKa90rYUiiL8QXRY+EyY24XNeAsSRceEMqDhm6E6Qmme7l0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfp5q-00028v-7E for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 00:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 96DD16000A;
 Wed, 14 Jan 2026 00:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CCAC116C6;
 Wed, 14 Jan 2026 00:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768351832;
 bh=+9zYSMUTpSMrvV0FSgMPb55zEujWI6/QvhZDmkn6Hcw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=V6+ilgFQW43CxxB0Ex+ogsongMpvbfghBmxkSgrWphV0lnjygSgFjqLckjm/gnIYy
 BwGcch325gDKgsJWHahl/rJlmW4p7BO4zv5sEv8yg5pHapsmUZqfsMcsHsmByLt+sl
 OFR5YQ8dFV++SqdKVZof43IPvg3PwKwwTT61iQ06lFcpjzMWHRbSua7eflJOrMeQow
 gLZY7HIu7oZ9DLWsHMgANHPS7tvpVr9yMB/8ZS7bBEUCxQCfczmw/FFe+LNnF0QKiN
 3Sbca5hVHFORscf4aNpf6DgtrE/LdqIlofXsrn6El0ez2oSNS6I8PV7UueHTe+RjQ7
 SxEP17tqGSImQ==
Message-ID: <dbc45ceb-a0d3-4046-8816-daeffad9cb38@kernel.org>
Date: Wed, 14 Jan 2026 08:50:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chuck Lever <cel@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>
References: <20260112174629.3729358-1-cel@kernel.org>
 <20260112174629.3729358-12-cel@kernel.org>
Content-Language: en-US
In-Reply-To: <20260112174629.3729358-12-cel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/13/2026 1:46 AM, Chuck Lever wrote: > From: Chuck Lever
 <chuck.lever@oracle.com> > > NFS and other remote filesystem protocols need
 to determine > whether a local filesystem performs case-insensi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfp5q-00028v-7E
Subject: Re: [f2fs-dev] [PATCH v3 11/16] f2fs: Add case sensitivity
 reporting to fileattr_get
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
Cc: pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 linux-ext4@vger.kernel.org, linkinjeon@kernel.org, sprasad@microsoft.com,
 frank.li@vivo.com, ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de,
 jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp, linux-nfs@vger.kernel.org,
 tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/13/2026 1:46 AM, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> NFS and other remote filesystem protocols need to determine
> whether a local filesystem performs case-insensitive lookups
> so they can provide correct semantics to clients. Without
> this information, f2fs exports cannot properly advertise
> their filename case behavior.
> 
> Report f2fs case sensitivity behavior via the file_kattr
> boolean fields. Like ext4, f2fs supports per-directory case
> folding via the casefold flag (IS_CASEFOLDED). Files are
> always case-preserving.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
