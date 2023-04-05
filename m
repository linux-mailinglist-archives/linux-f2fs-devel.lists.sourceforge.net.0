Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D696D8AB1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 00:38:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkBld-0004xP-Bi;
	Wed, 05 Apr 2023 22:38:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1pkBlc-0004x1-KS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 22:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sr4CJdOOx/6apQcfPjVNK8msYC2J6U4ttJpvFiO5hDA=; b=Fp0FRqo3jMEozJaqVrIipCqM2T
 9jsLk+GsXpK08d+Lq/z8kx4bOGg7l4agUISBiYnZJvfO2+hAkwWcrOm9rgGf7/duNvqTOWt9RGfCm
 BXhUj8hQiTIPvqPTpAnjnJjwfxjQEEYz0w7RGdEyRMM2cAeq0n8cmlotZb0GJqD4rthQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sr4CJdOOx/6apQcfPjVNK8msYC2J6U4ttJpvFiO5hDA=; b=YzkpbAxo1sdnmV4kgVwKf+0Isi
 IB/ZYYgL7CcztUKiUOXaq60FUlq0gwv8SPld7RSN1Ii4SBEcb0IfGb2vp07mGrkfgXujiYgowroBU
 QpgFeierSFnC97OXVNlaKBLKz8bqXX94Np0hsPxxZc/KyWrqKY+7iFSc0pS/swFjFwW4=;
Received: from mail-yw1-f171.google.com ([209.85.128.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pkBlb-00GLK8-Rv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 22:38:13 +0000
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-54bfa5e698eso39459447b3.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 15:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112; t=1680734286;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sr4CJdOOx/6apQcfPjVNK8msYC2J6U4ttJpvFiO5hDA=;
 b=A2ebZYUzCzt2QZN45XHO9sH3qZv8FJBym2XAniJvc2/xCjW5iPAi7qBvSOsMAUqYT/
 2Ib1XCWB0Ct5COj6bB1GLihqs0OjLEiM8q8v3vFk0n+A4RPqzuexTbIuVG9r0s3foB3X
 8BR9T5Nch7rgF+ni2YlWfSekUzi+kpJ8dmPTL0wRettkr01PTzDzoNyuUf+RdnD8mka0
 KDxUoF6C2YbylYaIre58+KiPMzhQg9X/cZqA1ZuBFYmuL8Xst5NTK8pP2FI8yNLlqh3s
 xug0xDIGUwOQoRITANY4rrUftRl0bxFCXFfsLdnAFcGcN1SwlrE+3ufV2N9v7SIYjVpg
 FpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680734286;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sr4CJdOOx/6apQcfPjVNK8msYC2J6U4ttJpvFiO5hDA=;
 b=hqUXm3cJ2VLKgA2cgg//3buwpWsIGQ3MSGC6+cGwfwP9KzxUuqaJaGPDbBUfxW6POa
 61a0Wl/bbkgEWF8ql1DOwILyHIMcy4JjzWYf0gxe2zfRiuCU6Dq1L/il7IXcywMBKolo
 TtxlSq1IAUKiicj7s42E8t4K3npi/bMDSkq41O6Dzz1zqI/YhQMKyY0DsAx2Zz8gAnZF
 t2ruXNU8u1VgGaj8qZbKCAVATSbLSzlLw5GGLUSh0vZ+oPuzCsbyeU+tz3NWztPt7ykO
 G8Ay4I2UBRi60DzGkZYwzoaAP51vPXLpl2gikWPm0TzljuIKKfT1H5ZHxkx14u9uqDN3
 oAcA==
X-Gm-Message-State: AAQBX9dE8vgKsqNZQnLu9XwbHoJUWx3Yc/6NaCCydo0z5iTnkjDBmo2c
 rUJf3wEhC2edN5QeIUYt0iuEuf9/u1NDkjRCabM=
X-Google-Smtp-Source: AKy350buwNZtgpjQjNrpY+dRBomVST4nFtdRBnQ6Mea8vZue8EC+2ZTK97MNMJLE5y0NZdZDQ14O+g==
X-Received: by 2002:aa7:9a44:0:b0:626:1c2a:2805 with SMTP id
 x4-20020aa79a44000000b006261c2a2805mr5960988pfj.25.1680732898541; 
 Wed, 05 Apr 2023 15:14:58 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 t17-20020a62ea11000000b005a9ea5d43ddsm11542560pfh.174.2023.04.05.15.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 15:14:58 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pkBP4-00HUS4-Uz; Thu, 06 Apr 2023 08:14:54 +1000
Date: Thu, 6 Apr 2023 08:14:54 +1000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230405221454.GQ3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
 <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
 <20230405150927.GD303486@frogsfrogsfrogs>
 <ZC2YsgYRsvBejGYY@infradead.org> <ZC23x22bxItnsANI@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZC23x22bxItnsANI@gmail.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 06:02:47PM +0000, Eric Biggers wrote:
 > And I really hope that you don't want to do DIO to the *Merkle tree*, as
 that Not for XFS - the merkle tree is not held as file data. That said, the
 merkle tree in XFS is not page cache or block aligned metadata either, so
 we really want the same memory buffer based interface for the merkle tree
 reading so that the merkle tree code [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.171 listed in wl.mailspike.net]
X-Headers-End: 1pkBlb-00GLK8-Rv
Subject: Re: [f2fs-dev] [PATCH v2 19/23] xfs: disable direct read path for
 fs-verity sealed files
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com,
 "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 06:02:47PM +0000, Eric Biggers wrote:
> And I really hope that you don't want to do DIO to the *Merkle tree*, as that

Not for XFS - the merkle tree is not held as file data.

That said, the merkle tree in XFS is not page cache or block aligned
metadata either, so we really want the same memory buffer based
interface for the merkle tree reading so that the merkle tree code
can read directly from the xfs-buf rather than requiring us to copy
it out of the xfsbuf into temporary pages...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
