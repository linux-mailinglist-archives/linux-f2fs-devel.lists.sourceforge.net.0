Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 759806C8E8A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Mar 2023 14:33:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pg41b-00045E-Kl;
	Sat, 25 Mar 2023 13:33:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1pg41a-000458-CC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Mar 2023 13:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ney3ZTNZKvrvV6ifyhERjCVEYlvSiageA+nB9FsX8A0=; b=VfeYUJDkS66lhSZE8uQwyi+mBA
 kmcc6viQwQYHjHI0HVFMoGYBi9PIgyxe66Lp9zDRNt5k2sZpzE7htNkaEivj+OsWXwqGaPMr1HO7l
 JLyAleooOvujYJSokTNdsKyatju/+spf+v67DJp04b8wLydAQLcnE9ANFsvVZEK4g4Ks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ney3ZTNZKvrvV6ifyhERjCVEYlvSiageA+nB9FsX8A0=; b=K85sHP3L1QZzhlH3zcMbpZ6cE1
 p5vm6M5qukEZ6gqkIUYTnfEPyYjhz0CThkviIshHE4NvkyrNYDPgMRrzu3hEubZjoPWl0x7hyh1L3
 rhFduv4MeY3HWdNJUNNymxM0LvOqtCQE0+eRrsVmFbrRjEC3aZwzV27km9cl/Gy2xC+M=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pg41X-0030iZ-VR for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Mar 2023 13:33:38 +0000
Received: from letrec.thunk.org (216.200.140.133.t01566-01.above.net
 [216.200.140.133] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 32PDX9Gw028167
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Mar 2023 09:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1679751191; bh=ney3ZTNZKvrvV6ifyhERjCVEYlvSiageA+nB9FsX8A0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=LcGkc2zou0310eThCZ1AEOKTbp4Vpq6qZ+O9C2HggIbD9jfV33spAdulbrcpxujnU
 CAKPm/qHNqjNTN+Vye0dk4M5I+2wyHQSvCH4jPBxR0wnu9mjzywP0L2921KiONR8SR
 18zfsE3AgUZh3tzbXA2Zw0cv/m3Qoi0ekUDE0glbYh9DUN/xzUsoj6LgcCeZHPMfva
 qnQ+/v63r8iqIeh5RykwVk/uAwKR81vXaIGM8Z4wge+3wekQhVjIZVfZRxPYsD+Qb5
 IbnxrYXhwqWvBxFG+tdnkeltDbQW0ZwZYBzIfhrFezgdteBix+vtAqv9JvKOlfyUuj
 Z3mvyJ6VNjhJQ==
Received: by letrec.thunk.org (Postfix, from userid 15806)
 id 37C698C0521; Sat, 25 Mar 2023 09:33:10 -0400 (EDT)
Date: Sat, 25 Mar 2023 09:33:10 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <ZB74FsfDDUegrqqx@mit.edu>
References: <20220622194603.102655-1-krisman@collabora.com>
 <20220622194603.102655-2-krisman@collabora.com>
 <20230323143320.GC136146@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323143320.GC136146@mit.edu>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 23, 2023 at 10:33:20AM -0400,
 Theodore Ts'o wrote:
 > On Wed, Jun 22, 2022 at 03:45:57PM -0400, Gabriel Krisman Bertazi wrote:
 > > Negative dentries support on case-insensitive ext4/f2fs wi [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1pg41X-0030iZ-VR
Subject: Re: [f2fs-dev] [PATCH 1/7] fs: Expose name under lookup to
 d_revalidate hook
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
Cc: kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 23, 2023 at 10:33:20AM -0400, Theodore Ts'o wrote:
> On Wed, Jun 22, 2022 at 03:45:57PM -0400, Gabriel Krisman Bertazi wrote:
> > Negative dentries support on case-insensitive ext4/f2fs will require
> > access to the name under lookup to ensure it matches the dentry.  This
> > adds an optional new flavor of cached dentry revalidation hook to expose
> > this extra parameter.
> > 
> > I'm fine with extending d_revalidate instead of adding a new hook, if
> > it is considered cleaner and the approach is accepted.  I wrote a new
> > hook to simplify reviewing.
> > 
> > Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> 
> Al, could you take a look and see if you have any objections?

Ping, Al, any objsections if I take Gabriel's patch series via the
ext4 tree?

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
